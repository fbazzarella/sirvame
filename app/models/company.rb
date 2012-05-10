class Company < ActiveRecord::Base
  PLANS = %w(none plus)

	attr_accessible :name, :phone, :address, :segments, :products, :username, :plus, :plan, as: :admin

	validates :name, :phone, :segments, presence: true
  validates :username, format: {with: /\A[-_\.a-z0-9]+\Z/}, allow_blank: true
  validates :plan, inclusion: {in: PLANS}

  def self.plans # Just for Typus
    PLANS
  end
end