SirvaMe::Application.routes.draw do

  root                        to: 'company#index'
  get  '/saiba-mais',         to: 'company#new',  as: 'know_more'
  get  '/experimente-gratis', to: 'company#new',  as: 'try_for_free'

end
