# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
	render_views

	describe "GET index" do
		Factory(:company, product_list: 'bike')

		context "with search params" do
			it "should assign a array on companies with results" do
				get :index, encontrar: 'bike'
				assigns(:companies).should be_a(Array)
				assigns(:companies).first.should be_a(Company)
			end

			it "should assign a array on companies without results" do
				get :index, encontrar: 'icecream'
				assigns(:companies).should be_a(Array)
				assigns(:companies).should be_empty
			end
		end

		context "without search params" do
			it "should assign a array on companies with random results" do
				get :index
				assigns(:companies).should be_a(Array)
				assigns(:companies).first.should be_a(Company)
			end
		end

		it "should return success" do
			get :index
			response.should be_success
		end
	end
end