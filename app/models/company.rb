# encoding: utf-8
class Company < ActiveRecord::Base
	attr_accessible :name, :phone, :address, :segment_list, :product_list, :plus, as: :admin

	validates :name, :phone, :segment_list, :product_list, presence: true

	acts_as_taggable_on :segments, :products
end