namespace :db do
	desc "Dump all database data and structure"
	task backup: :environment do
		config    = ActiveRecord::Base.configurations[Rails.env]
		version   = Time.now.to_s.parameterize.split('-').join[0..-5]
		file_name = "#{config['database']}_#{version}.pgsql"
		file      = Rails.root.join('db/backup', file_name).to_s

		system "PGPASSWORD=#{config['password']} pg_dump -h localhost -U #{config['username']} #{config['database']} > #{file}"

		# How to restore a backup:
		# psql -h host -U username -d database -W < file.pgsql
	end
end