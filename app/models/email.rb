class Email < ActiveRecord::Base
	attr_accessible :name, :email, as: :admin
	validates :name, :email, presence: true
end