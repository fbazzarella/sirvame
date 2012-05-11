require 'spec_helper'

describe PagesController do
  describe "routing" do
    it "should sitemap path routes to sitemap" do
      get('/sitemap.xml').should route_to('pages#sitemap', format: 'xml')
      sitemap_path(format: :xml).should == '/sitemap.xml'
    end
  end
end