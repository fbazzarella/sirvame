namespace :db do
	require 'colored'

	desc "Dump all database's data and structure"
	task backup: :environment do
		puts "Backing up your #{Rails.env} database... ".green.bold

		config      = ActiveRecord::Base.configurations[Rails.env]
		dropbox_dir = '~/Dropbox/sirvame-apps'
		backup_dir  = Rails.root.join('db/backup').to_s
		file        = "#{config['database']}_#{Time.now.strftime('%Y%m%d%H%M%S')}.pgsql"

		system "PGPASSWORD=#{config['password']} pg_dump --clean -h localhost -U #{config['username']} #{config['database']} > #{backup_dir}/#{file}"
		system "rsync -av --update --delete #{backup_dir}/* #{dropbox_dir}/sirvame" if Rails.env.production?

		puts "Done!".green.bold
	end

	desc "Restore last database backup"
	task restore: :environment do
		if ARGV[1].present?
			puts "Restoring database backup from '#{ARGV[1]}'...".green.bold

			config = ActiveRecord::Base.configurations[Rails.env]
			file   = Rails.root.join(ARGV[1]).to_s

			print "You're in #{Rails.env.titleize}! Are you sure? ".red.bold

			system "psql -h localhost -U #{config['username']} -d #{config['database']} -W < #{file}"

			puts "Done!".green.bold
		else
			puts "Please tell me the file that you want to restore...".yellow.bold
		end
	end
end
