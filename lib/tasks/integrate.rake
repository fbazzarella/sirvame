task :integrate do
	APP = 'sirvame-staging'

	def run(*cmd)
		system(*cmd)
		raise "Command #{cmd.inspect} failed!" unless $?.success?
	end

	puts "-----> Pulling from Bitbucket"
	run "git pull --rebase"

	puts "-----> Pushing to Bitbucket"
	run "git push origin master"

	puts "-----> Deploy to Staging"
	run "git push git@heroku.com:#{APP}.git HEAD:master -f"

	puts "-----> Migrating"
	run "heroku run rake db:migrate --app #{APP}"

	puts "-----> Restarting"
	run "heroku restart --app #{APP}"
end