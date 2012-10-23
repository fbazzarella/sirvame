namespace :deploy do
  def deploy_to!(environment = nil)
    if environment.present?
      sh "git push fbazzarella@sirvame.com:apps/sirvame-#{environment.to_s}.git HEAD:master -f"
    end
  end

	desc "Deploy Sirva.me to production"
	task :production do
		deploy_to! :production
	end

	task :staging do
		deploy_to! :staging
	end
end
