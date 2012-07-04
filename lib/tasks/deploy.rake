namespace :deploy do
  before_run = ['log:clear', 'tmp:clear']

	desc "Deploy Sirva.me to production"
	task production: before_run do
		system "git push fbazzarella@sirvame.com:sirvame-production.git HEAD:master -f"
	end

	desc "Deploy Sirva.me to staging"
	task staging: before_run do
		system "git push fbazzarella@sirvame.com:sirvame-staging.git HEAD:master -f"
	end
end