# encoding: utf-8
class Company < ActiveRecord::Base
	attr_accessible :name, :phone, :address, as: :admin

	validates :name, :phone, presence: true
end