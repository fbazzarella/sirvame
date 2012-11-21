Shuttle.setup do |s|
  s.steps = [
    'shuttle:git:check',
    'shuttle:git:pull',
    'shuttle:bundle',
    'db:migrate',
    'shuttle:spec',
    'shuttle:git:push',
    'log:clear',
    'tmp:clear'
  ]

  s.stages = {
    staging:    'fbazzarella@sirvame.com:apps/sirvame-staging.git',
    production: 'fbazzarella@sirvame.com:apps/sirvame-production.git'
  }
end
