class Company < ActiveRecord::Base
	attr_accessible :name, :phone, :address, :segments, :products, :username, :plus, as: :admin
	validates :name, :phone, :segments, presence: true
  validates :username, format: {with: /\A[-_\.a-z0-9]+\Z/}, allow_blank: true
end