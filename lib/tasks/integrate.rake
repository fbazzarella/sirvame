# encoding: utf-8
task :integrate do
	require 'colored'
	APP = 'sirvame-staging'

	def run(*cmd)
		system(*cmd)
		raise "Command #{cmd.inspect} failed!" unless $?.success?
	end

	puts '-----> Pulling from Bitbucket'.green.bold
	run "git pull --rebase origin master"

	puts '-----> Pushing to Bitbucket'.green.bold
	run "git push origin master"

	puts '-----> Deploying to Staging'.green.bold
	run "git push git@heroku.com:#{APP}.git HEAD:master -f"

	puts '-----> Migrating'.green.bold
	run "heroku run rake db:migrate --app #{APP}"

	puts '-----> Restarting'.green.bold
	run "heroku restart --app #{APP}"
end