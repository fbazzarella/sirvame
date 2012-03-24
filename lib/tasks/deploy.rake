# encoding: utf-8
task :deploy do
	require 'colored'
	APP = 'sirvame-production'

	def run(*cmd)
		system(*cmd)
		raise "Command #{cmd.inspect} failed!" unless $?.success?
	end

	puts '-----> Deploying to Production'.green.bold
	run "git push git@heroku.com:#{APP}.git HEAD:master -f"

	puts '-----> Migrating'.green.bold
	run "heroku run rake db:migrate --app #{APP}"

	puts '-----> Restarting'.green.bold
	run "heroku restart --app #{APP}"

	puts '-----> Tá no ar! Reza pra essa joça funcionar!'.yellow.bold
end