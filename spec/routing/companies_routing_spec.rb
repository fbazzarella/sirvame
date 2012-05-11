require 'spec_helper'

describe CompaniesController do
  describe "routing" do
    it "should root path routes to index" do
      get('/').should route_to('companies#index')
      root_path.should == '/'
    end

    it "should search path routes to index" do
      get('/encontrar').should route_to('companies#index')
    end

    it "should company path routes do show" do
    	get('/encontrei/company').should route_to('companies#show', company: 'company')
    	company_path(:company).should == '/encontrei/company'
    end

    it "should company page path routes do show" do
    	get('/encontrei/company/page').should route_to('companies#show', company: 'company', page: 'page')
    	company_path(:company, :page).should == '/encontrei/company/page'
    end
  end
end