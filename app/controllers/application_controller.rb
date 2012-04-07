class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  before_filter :login_required_for_production_view

  def login_required_for_production_view
    if Rails.env.production? || Rails.env.staging?
      authenticate_or_request_with_http_basic do |name, password|
        name == 'root' && password == 'qwe123'
      end
    end
  end
end