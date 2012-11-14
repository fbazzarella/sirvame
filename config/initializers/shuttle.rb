Shuttle.setup do |s|
  s.steps = [
    'shuttle:start',
    'shuttle:bundle',
    'db:migrate',
    'shuttle:spec',
    'shuttle:git:push'
  ]

  s.stages = {
    staging:    'fbazzarella@sirvame.com:apps/sirvame-staging.git',
    production: 'fbazzarella@sirvame.com:apps/sirvame-production.git'
  }
end
