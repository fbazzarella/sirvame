class PagesController < ApplicationController
  def sitemap
    @companies = Company.all_to_sitemap
  end
end