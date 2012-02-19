# encoding: utf-8
Company.destroy_all

Company.create!([{
	name:         'Padaria Ki-Sabor',
	phone:        '24 2452 2222',
	address:      'Rua Com. Antonio Jannuzzi, 42, A, Belo Horizonte (Subida do Quartel)',
	segment_list: 'Padaria, Confeitaria',
	product_list: 'bolos, tortas, salgados, pão, pães'
},{
	name:         'RogeGuts',
	phone:        '24 2452 3333',
	address:      'Rua Cel. João Rufino, 123, Centro (Jardim de Cima)',
	segment_list: 'Lanchonete, Restaurante, Sorveteria',
	product_list: 'lanche, hamburger, sorvete, refeição, almoço, entrega'
},{
	name:         'Drogaria Benfica',
	phone:        '24 2452 7263',
	address:      'Rua dos Mineiros, 122, B, Centro',
	segment_list: 'Drogaria, Farmácia, Perfumaria',
	product_list: 'cosméticos, perfumes, remédios, genéricos, farmácia popular'
}], as: :admin)