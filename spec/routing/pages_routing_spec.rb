require 'spec_helper'

describe PagesController do
  describe "routing" do
    it "should questions path routes to questions" do
      get('/tire-suas-duvidas').should route_to('pages#questions')
      questions_path.should == '/tire-suas-duvidas'
    end

    it "should sitemap path routes to sitemap" do
      get('/sitemap.xml').should route_to('pages#sitemap', format: 'xml')
      sitemap_path(format: :xml).should == '/sitemap.xml'
    end

    it "should robots path routes to robots" do
      get('/robots.txt').should route_to('pages#robots', format: 'txt')
      robots_path(format: :txt).should == '/robots.txt'
    end
  end
end
