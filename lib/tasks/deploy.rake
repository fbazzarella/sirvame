namespace :deploy do
  before_run = ['log:clear', 'tmp:clear', 'deploy:origin']

  def push_and_deploy_to!(environment = nil)
    if environment.present?
      server = 'fbazzarella@sirvame.com'

      system "git push #{server}:apps/sirvame-#{environment.to_s}.git HEAD:master -f"
      system "ssh #{server} 'cd apps && ./sirvame-#{environment.to_s}.sh'"
    end
  end

  desc "Push Sirva.me to origin"
  task :origin do
    system "git push origin master"
  end

	desc "Deploy Sirva.me to production"
	task production: before_run do
		push_and_deploy_to! :production
	end

	desc "Deploy Sirva.me to staging"
	task staging: before_run do
		push_and_deploy_to! :staging
	end

  desc "Deploy Sirva.me to all environments"
  task all: [:staging, :production]
end