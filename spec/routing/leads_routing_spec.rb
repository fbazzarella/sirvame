require 'spec_helper'

describe LeadsController do
  describe "routing" do
    it "should new path routes to new" do
      get('/anunciar-gratis-por-30-dias').should route_to('leads#new')
      new_leads_path.should == '/anunciar-gratis-por-30-dias'
    end
  end
end