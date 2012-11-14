class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  before_filter lambda {
    authenticate_or_request_with_http_basic { |u, p|
      u == 'root' && p == 'qwe123' } if Rails.env.staging? }
end
