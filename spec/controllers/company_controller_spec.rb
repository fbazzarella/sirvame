# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
	render_views
	
	describe "GET index" do
		it "should returns success" do
			get :index
			response.should be_success
		end
	end
end