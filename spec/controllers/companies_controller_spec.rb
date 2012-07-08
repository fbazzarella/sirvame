require 'spec_helper'

describe CompaniesController do
	render_views

	describe "GET index" do
		let!(:company) { FactoryGirl.create(:company, products: 'coffee') }
		let!(:company1) { FactoryGirl.create(:company, products: 'fruit, juice') }

		context "with search params" do
			it "should assign a array on companies with results" do
				get :index, encontrar: 'coffee'
				assigns(:companies).should be_a(Array)
				assigns(:companies).first.should be_a(Company)
			end

			xit "should return companies ordered by relevance" do
				get :index, encontrar: 'coffee+fruit+juice'
				assigns(:companies).should == [company1, company]
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

		describe "rendering" do
			it "should return success" do
				get :index
				response.should be_success
			end

			it "should render search results with layout" do
				get :index, format: :html
				response.should render_template('search_results')
				response.should render_with_layout('application')
			end

			it "should render search results without layout" do
				get :index, format: :js
				response.should render_template('search_results')
				response.should_not render_with_layout('application')
			end

			it "should render search results as json" do
				get :index, format: :json
				response.body.should =~ /\"address\"\:\"Company Address\, 11\, 111\"/
			end
		end
	end

	describe "GET show" do
		dir    = Rails.root.join('app/views/companies/company-name')
		before { FileUtils.touch(FileUtils.mkdir_p(dir).join + '/home.html.erb') }
		after  { FileUtils.rm_r(dir) }

		context "valid company params" do
			it "should render right template with company name" do
				get :show, company: 'company-name'
				response.should render_template('company-name/home')
				response.should render_with_layout('application')
				response.should be_success
			end

			it "should render right template with company name and page" do
				get :show, company: 'company-name', page: 'home'
				response.should render_template('company-name/home')
				response.should render_with_layout('application')
				response.should be_success
			end
		end

		context "invalid company params" do
			it "should return not found error with bad company name" do
				get :show, company: 'other-company', page: 'home'
				response.should render_template(Rails.root.join('public/404.html'))
				response.should be_not_found
			end

			it "should return not found error with bad page name" do
				get :show, company: 'company', page: 'other-page'
				response.should render_template(Rails.root.join('public/404.html'))
				response.should be_not_found
			end
		end
	end
end