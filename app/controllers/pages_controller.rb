class PagesController < ApplicationController
  def sitemap
    @companies = Company.all_to_sitemap
  end

  def robots
  end
end