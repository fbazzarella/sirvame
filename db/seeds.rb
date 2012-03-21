# encoding: utf-8

if Rails.env.development?
	Company.destroy_all

	Company.create!([{
		name:         'Carlão Academia',
		phone:        '24 2453 3399',
		segment_list: 'Academia, Musculação',
		product_list: 'musculação, lutas, jiu-jitsu, judô',
		plus:         true
	},{
		name:         'Açougue Boi Bom',
		phone:        '24 2453 4053',
		segment_list: 'Açougue, Casa de Carne',
		product_list: 'carnes, carvão, churrasco, linguiça'
	},{
		name:         'Miliartes',
		phone:        '24 2453 3123',
		segment_list: 'Gráfica, Identidade, Visual',
		product_list: 'adesivos, cartões, visita, panfletos, cartazes, impressões',
		plus:         true
	},{
		name:         'Adelino dos Santos',
		phone:        '24 2452 3638',
		segment_list: 'Advogado, Advocacia, Imóveis, Imobiliária',
		product_list: 'criminal, criminalista, casas, apartamentos'
	},{
		name:         'Etal Turismo',
		phone:        '24 2453 4661',
		segment_list: 'Turismo, Viagens',
		product_list: 'passeio, viagem, excursão'
	},{
		name:         'Casa das Antenas',
		phone:        '24 2453 3358',
		segment_list: 'Antenas, Alarmes',
		product_list: 'segurança, portão, portões, sky, parabólicas',
		plus:         true
	},{
		name:         'Águas do Vale',
		phone:        '24 2452 3864',
		segment_list: 'Gás',
		product_list: 'água'
	}], as: :admin)
end