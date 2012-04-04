# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
	render_views

	describe "GET index" do
		context	"with search params" do
			let!(:company) { Factory(:company) }
			let!(:other_company) { Factory(:company, product_list: 'bike') }

			it "should return companies filtered by search params" do
				get :index, encontrar: 'bike'
				assigns(:companies).should == [other_company]
			end

			it "should return empty array if not found any company with search params" do
				get :index, encontrar: 'icecream'
				assigns(:companies).should == []
			end
		end

		context "without search params" do
			it "should return maximum 9 random companies" do
				10.times { Factory(:company) }
				get :index
				assigns(:companies).count.should <= 9
			end
		end

		it "should return success" do
			get :index
			response.should be_success
		end
	end
end