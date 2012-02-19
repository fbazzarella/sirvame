SirvaMe::Application.routes.draw do
  root                        to: 'company#index'
  get '/search', as: :search, to: 'company#index'
end