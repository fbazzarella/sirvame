# encoding: utf-8
if Rails.env.development?
	Company.destroy_all

	Company.create!([{
		name:    'Padaria Ki-Sabor',
		phone:   '(24) 2452-2222',
		address: 'Rua Com. Antonio Jannuzzi, 42, A'
	},{
		name:    'RogeGuts',
		phone:   '(24) 2452-3333',
		address: 'Rua Cel. João Rufino, 123'
	},{
		name:    'Drogaria Benfica',
		phone:   '(24) 2452-7263',
		address: 'Rua dos Mineiros, 122, B'
	}], as: :admin)
end