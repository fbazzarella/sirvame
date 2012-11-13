class Lead < ActiveRecord::Base
  attr_accessible :company_name, :contact_name, :email

  validates :company_name, :contact_name, :email, presence: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}, allow_blank: true

  after_create { NotificationMailer.new_lead.deliver }
end
