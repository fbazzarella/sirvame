# encoding: utf-8
class Email < ActiveRecord::Base
	attr_accessible :name, :email
	validates :name, :email, presence: true
end