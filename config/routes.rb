SirvaMe::Application.routes.draw do
  root                                            to: 'company#index'
  get '/pesquisar(/:search_params)', as: :search, to: 'company#index'
end