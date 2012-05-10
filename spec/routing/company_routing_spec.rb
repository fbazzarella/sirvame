require 'spec_helper'

describe CompanyController do
  describe "routing" do
    it "should root path routes to index" do
      get('/').should route_to('company#index')
      root_path.should == '/'
    end

    it "should search path routes to index" do
      get('/encontrar').should route_to('company#index')
    end

    it "should company path routes do show" do
    	get('/encontrei/company').should route_to('company#show', company: 'company')
    	company_path(:company).should == '/encontrei/company'
    end

    it "should company page path routes do show" do
    	get('/encontrei/company/page').should route_to('company#show', company: 'company', page: 'page')
    	company_path(:company, :page).should == '/encontrei/company/page'
    end
  end
end