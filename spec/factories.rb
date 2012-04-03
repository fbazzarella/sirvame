# -*- encoding : utf-8 -*-
FactoryGirl.define do
	factory :company do
		name         'Company Name'
		phone        '24 2452 2222'
		address      'Company Address, 11, 111'
		segment_list 'Segment, List'
		product_list 'product, list'
	end
end