# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
	render_views
	
	describe "GET index" do
		let!(:company) { Factory(:company) }

		before :each do
			get :index
		end

		it "should return all companies" do
			assigns(:companies).should == [company]
		end

		it "should return success" do
			response.should be_success
		end
	end
end