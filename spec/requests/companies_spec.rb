require 'spec_helper'

describe Company do
	let!(:company) { FactoryGirl.create(:company, segments: 'Movies', products: 'dvds', plan: 'plus') }

	describe "Catalog" do
		before { visit root_path }

		describe "visit catalog" do
			it "should display search results if exist some company" do
				page.should have_content('Company Name')
				page.should have_content('Movies [dvds]')
			end

			it "should display result as paying" do
				page.find('.highlight.result').should be
			end
		end

		describe "perform company search" do
			shared_examples "company search" do
				it "should display 'not found' and than display a founded result" do
					fill_in 'search-field', with: 'coffee fruit'
					click_button 'submit-search'

					page.find('#none-companies').should be

					fill_in 'search-field', with: 'movies dvds'
					click_button 'submit-search'

					page.should have_content('Company Name')
					page.should have_content('Movies [dvds]')
				end
			end

			# context "with ajax", js: true do
			# 	it_behaves_like "company search" # Run this when JS is modified...
			# end

			context "without ajax" do
				it_behaves_like "company search"
			end
		end

		describe "visit company page" do
			it "should display company page" do
				click_link 'Ver detalhes de Company Name'
				
				page.should have_content('« Voltar ao Catálogo')
			end
		end
	end

	describe "Company Page" do
		describe "back to catalog" do
			it "should back to catalog" do
				visit company_path('company-name')
				click_link '« Voltar ao Catálogo'

				page.should have_content('Encontre o que precisa')
			end
		end
	end
end
