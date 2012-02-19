# -*- encoding : utf-8 -*-
FactoryGirl.define do
	factory :company do
		name         'Padaria Ki-Sabor'
		phone        '24 2452 2222'
		address      'Rua Com. Antonio Jannuzzi, 42, A, Belo Horizonte (Subida do Quartel)'
		segment_list 'Padaria, Confeitaria'
		product_list 'bolos, tortas, salgados, pão, pães'
	end
end