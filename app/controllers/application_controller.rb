class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  before_filter :login_required_for_production_view

  def login_required_for_production_view
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |name, password|
        name == 'root' && password == '1q2w3e4r'
      end
    end
  end
end