SirvaMe::Application.routes.draw do
  root to: 'companies#index'

  get  '/experimente-gratis-sem-compromisso-por-30-dias',               to: 'leads#new',        as: :new_lead
  post '/experimente-gratis-sem-compromisso-por-30-dias',               to: 'leads#create',     as: :leads
  get  '/experimente-gratis-sem-compromisso-por-30-dias/sabia-decisao', to: 'leads#effectived', as: :effectived_lead
  
  get '/tire-suas-duvidas',      to: 'pages#questions', as: :questions
  get '/sitemap',                to: 'pages#sitemap',   as: :sitemap
  get '/robots',                 to: 'pages#robots',    as: :robots

  get '/encontrar(/:encontrar)', to: 'companies#index', as: :companies
  get '/:company',               to: 'companies#show',  as: :company
end
