namespace :deploy do
	desc "Deploy Sirva.me to production"
	task :production do
		system "git push fbazzarella@sirvame.com:sirvame-production.git HEAD:master -f"
	end

	desc "Deploy Sirva.me to staging"
	task :staging do
		system "git push fbazzarella@sirvame.com:sirvame-staging.git HEAD:master -f"
	end
end