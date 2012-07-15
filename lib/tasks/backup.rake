namespace :db do
	require 'colored'

	desc "Dump all database's data and structure"
	task backup: :environment do
		print "Backing up your #{Rails.env} database... ".green.bold

		config    = ActiveRecord::Base.configurations[Rails.env]
		version   = Time.now.to_s.parameterize.split('-').join[0..-5]
		file_name = "#{config['database']}_#{version}.pgsql"
		file      = Rails.root.join('db/backup', file_name).to_s

		system "PGPASSWORD=#{config['password']} pg_dump -h localhost -U #{config['username']} #{config['database']} > #{file}"

		puts "Done!".green.bold
	end

	desc "Restore last database backup"
	task restore: ['db:drop', 'db:create'] do
		puts "Restoring your last #{Rails.env} database backup...".green.bold
		print "Are you sure? ".red.bold

		config       = ActiveRecord::Base.configurations[Rails.env]
		last_version = `ls -r #{Rails.root.join('db/backup').to_s} | egrep -o -m 1 "[0-9]{14}"`[0..-2]
		file_name    = "#{config['database']}_#{last_version}.pgsql"
		file         = Rails.root.join('db/backup', file_name).to_s

		system "psql -h localhost -U #{config['username']} -d #{config['database']} -W < #{file}"

		Rake::Task['db:test:prepare'].execute if Rails.env.development?
	
		puts "Done!".green.bold
	end
end