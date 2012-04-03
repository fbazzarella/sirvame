# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
	render_views

	describe "GET index" do
		let!(:company) { Factory(:company) }
		let!(:other_company) { Factory(:company, product_list: 'bike') }

		context	"with search params" do
			it "should return companies filtered by search params" do
				get :index, search_params: 'bike'
				assigns(:companies).should == [other_company]
			end

			it "should return empty array when does not exists any companies with specified search param" do
				get :index, search_params: 'icecream'
				assigns(:companies).should == []
			end
		end

		context "without search params" do
			it "should return all companies" do
				get :index
				assigns(:companies).should be_include(company)
				assigns(:companies).should be_include(other_company)
			end
		end

		it "should return success" do
			get :index
			response.should be_success
		end
	end
end