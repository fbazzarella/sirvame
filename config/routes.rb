SirvaMe::Application.routes.draw do
  root                           to: 'company#index'
  get '/encontrar(/:encontrar)', to: 'company#index'
  get '/:company(/:page)',       to: 'company#show', as: :company
end