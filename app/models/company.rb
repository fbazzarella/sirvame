class Company < ActiveRecord::Base
  PLANS = %w(none plus)

  attr_accessible :name, :phone, :address, :segments, :products, :username, :plan, as: :admin

  validates :name, :phone, :segments, presence: true
  validates :username, format: {with: /\A[-_\.a-z0-9]+\Z/}, allow_blank: true
  validates :plan, inclusion: {in: PLANS}

  scope :all_to_sitemap, where("plan != 'none' and username != ''")

  def have_page?
    plan != 'none' && !username.blank?
  end

  def self.plans # Just for Typus
    PLANS
  end
end