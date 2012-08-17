SirvaMe::Application.routes.draw do
  root                                to: 'companies#index'

  get '/encontrar(/:encontrar)',      to: 'companies#index'
  get '/anunciar-gratis-por-30-dias', to: 'leads#new',      as: :new_leads
  get '/sitemap',                     to: 'pages#sitemap',  as: :sitemap
  get '/robots',                      to: 'pages#robots',   as: :robots
  get '/:company',                    to: 'companies#show', as: :company
end