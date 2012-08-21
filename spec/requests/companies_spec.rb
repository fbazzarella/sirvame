# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Companies" do
	before do
		FactoryGirl.create(:company, segment_list: 'Movies', product_list: 'dvds')
		visit root_path
	end

	describe "visit root path" do
		it "should display search results if exist some company" do
			page.should have_content('Company Name')
			page.should have_content('Movies [dvds]')
		end
	end

	describe "perform company search" do
		it "should display 'not found' message if none companies found" do
			fill_in 'search-field', with: 'coffee, fruit'
			click_button 'submit-search'

			page.should have_no_selector(:xpath, './/li[@class="result"]')
			page.should have_selector(:xpath, './/li[@class="none-companies"]')
		end

		it "should display search results if companies found" do
			fill_in 'search-field', with: 'movies, dvds'
			click_button 'submit-search'

			page.should have_content('Company Name')
			page.should have_content('Movies [dvds]')
		end
	end
end