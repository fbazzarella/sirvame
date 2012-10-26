Shuttle.setup do |s|

  # TODO: Setup Steps Description

  s.steps = [
    'shuttle:start',
    'shuttle:bundle',
    'db:migrate',
    'shuttle:spec',
    'shuttle:git:push'
  ]

  # TODO: Setup Stages Description

  s.stages = {
    staging:    'fbazzarella@sirvame.com:apps/sirvame-staging.git',
    production: 'fbazzarella@sirvame.com:apps/sirvame-production.git'
  }

end
