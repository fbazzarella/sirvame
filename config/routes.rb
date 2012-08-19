SirvaMe::Application.routes.draw do
  root to: 'companies#index'

  get  '/anunciar-gratis-por-30-dias',               to: 'leads#new',        as: :new_lead
  post '/anunciar-gratis-por-30-dias',               to: 'leads#create',     as: :leads
  get  '/anunciar-gratis-por-30-dias/sabia-decisao', to: 'leads#effectived', as: :effectived_lead
  
  get '/sitemap',                to: 'pages#sitemap',   as: :sitemap
  get '/robots',                 to: 'pages#robots',    as: :robots

  get '/encontrar(/:encontrar)', to: 'companies#index', as: :companies
  get '/:company',               to: 'companies#show',  as: :company
end