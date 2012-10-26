Shuttle.setup do |s|

  # TODO: Setup Steps Description

  s.steps = [
    'shuttle:start',
    'shuttle:bundle',
    'db:migrate',
    'shuttle:spec',
    'shuttle:git:push',
    'shuttle(staging)'
  ]

  s.stages = {
    staging: 'fbazzarella@sirvame.com:apps/sirvame-staging.git'
  }

end
