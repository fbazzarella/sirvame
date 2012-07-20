# encoding: utf-8
require 'spec_helper'

describe Search do
	describe "associations" do
		it { should have_and_belong_to_many(:companies) }
	end

	describe "mass assignment security" do
		[:word_list, :companies].each do |attr|
			it { should allow_mass_assignment_of(attr).as(:search) }
		end
	end

	describe "validations" do
		it { should validate_presence_of(:word_list) }
	end

	describe "perform with" do
		8.times         { FactoryGirl.create(:company) }

		let!(:company)  { FactoryGirl.create(:company, name: 'Petit Marché') }
		let!(:company1) { FactoryGirl.create(:company, segments: 'Motors', products: 'bike') }
		let!(:company2) { FactoryGirl.create(:company, segments: 'Sports', products: 'ball') }

		let!(:company3) { FactoryGirl.create(:company, products: 'toys') }
		let!(:company4) { FactoryGirl.create(:company, segments: 'Movies', plan: 'plus') }

		context "without word list" do
			it "should return maximum 12 random companies" do
				Search.perform_with.count.should <= 12
			end
		end

		context "with word list" do
			it "should save a search information" do
				expect do
					Search.perform_with('word list')
				end.to change(Search, :count).by(1)
			end

			it "should save word list as tags" do
				Search.perform_with('word')

				search_tag = Search.first.words.first

				search_tag.should be_a(ActsAsTaggableOn::Tag)
				search_tag.name.should == 'word'
			end

			it "should save founded companies as search results" do
				Search.perform_with('bike ball')
				Search.first.companies.should include(company1, company2)
			end

			it "should return companies filtered by word list" do
				Search.perform_with('bike ball').should include(company1, company2)
				Search.perform_with('bike ball').should_not include(company)
			end

			it "should return companies filtered by word list ignoring accents" do
				Search.perform_with('petít').should include(company)
				Search.perform_with('marche').should include(company)
			end

			it "should return companies ordered by relevance" do
				Search.perform_with('motors bike ball').should == [company1, company2]
				Search.perform_with('sports bike ball').should == [company2, company1]
			end

			it "should return paying companies before others" do
				Search.perform_with('movies toys').should == [company4, company3]
			end

			it "should return empty array if not found any company with word list" do
				Search.perform_with('icecream').should be_a(Array)
				Search.perform_with('icecream').should be_empty
			end
		end
	end
end