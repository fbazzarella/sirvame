namespace :deploy do
  def deploy_to!(environment = nil)
    if environment.present?
      ssh = {
        host:     'sirvame.com',
        username: 'fbazzarella',
        sudopass: ENV['SMTP_PASSWORD']
      }

      system "git push #{ssh[:username]}@#{ssh[:host]}:apps/sirvame-#{environment.to_s}.git HEAD:master -f"
      system "ssh #{ssh[:username]}@#{ssh[:host]} \"cd apps && echo '#{ssh[:sudopass]}' | sudo -S ./sirvame-#{environment.to_s}.sh\""
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
