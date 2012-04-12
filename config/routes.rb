SirvaMe::Application.routes.draw do
  root                           to: 'company#index'
  get '/encontrar(/:encontrar)', to: 'company#index'

  get '/ver-detalhes/academia-equilibrio', to: 'company#academia_equilibrio', as: :academia_equilibrio
end