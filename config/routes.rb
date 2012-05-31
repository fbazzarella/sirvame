SirvaMe::Application.routes.draw do
  root                               to: 'companies#index'

  get '/encontrar(/:encontrar)',     to: 'companies#index'
  
  get '/sitemap',                    to: 'pages#sitemap',  as: :sitemap
  get '/robots',                     to: 'pages#robots',   as: :robots

  get '/:company(/:page)',           to: 'companies#show', as: :company
end