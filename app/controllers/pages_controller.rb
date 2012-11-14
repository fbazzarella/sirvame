class PagesController < ApplicationController
  def questions
  end

  def sitemap
    @companies = Company.all_to_sitemap
  end

  def robots
  end
end
