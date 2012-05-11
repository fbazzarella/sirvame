require 'spec_helper'

describe "Home Page" do
	before do
		FactoryGirl.create(:company, segments: 'Movies', products: 'dvds', plan: 'plus')
		visit root_path
	end

	describe "visit root path" do
		it "should display search results if exist some company" do
			page.should have_content('Company Name')
			page.should have_content('Movies [dvds]')
		end

		it "should display result as paying" do
			page.find('.highlight.result').should be
		end
	end

	describe "perform company search" do
		context "using ajax", js: true do
			it "should display 'not found' message if none companies found" do
				fill_in 'search-field', with: 'coffee, fruit'
				click_button 'submit-search'

				page.find('#none-companies').should be
			end

			it "should display search results if companies found" do
				fill_in 'search-field', with: 'movies, dvds'
				click_button 'submit-search'

				page.should have_content('Company Name')
				page.should have_content('Movies [dvds]')
			end
		end

		context "without using ajax" do
			it "should display 'not found' message if none companies found" do
				fill_in 'search-field', with: 'coffee, fruit'
				click_button 'submit-search'

				page.find('#none-companies').should be
			end

			it "should display search results if companies found" do
				fill_in 'search-field', with: 'movies, dvds'
				click_button 'submit-search'

				page.should have_content('Company Name')
				page.should have_content('Movies [dvds]')
			end
		end
	end

	describe "visit company page" do
		it "should display company page" do
			click_link 'Ver detalhes de Company Name'
			current_path.should == company_path('company-name')
		end
	end
end