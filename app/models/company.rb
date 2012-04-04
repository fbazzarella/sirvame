# encoding: utf-8
class Company < ActiveRecord::Base
	attr_accessible :name_list, :phone, :address, :segment_list, :product_list, :plus, as: :admin
	validates :name_list, :phone, :segment_list, presence: true
	acts_as_taggable_on :names, :segments, :products
end