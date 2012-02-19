# -*- encoding : utf-8 -*-
require 'spec_helper'

describe CompanyController do
  describe "routing" do
    it "should routes to #index" do
      get('/').should route_to('company#index')
      root_path.should == '/'
    end
  end
end