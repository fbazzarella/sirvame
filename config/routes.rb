SirvaMe::Application.routes.draw do
  root                               to: 'companies#index'

  get '/encontrar(/:encontrar)',     to: 'companies#index'
  get '/encontrei/:company(/:page)', to: 'companies#show', as: :company
  
  get '/sitemap',                    to: 'pages#sitemap',  as: :sitemap
  get '/robots',                     to: 'pages#robots',   as: :robots
end