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
		10.times        { FactoryGirl.create(:company) }

		let!(:company1) { FactoryGirl.create(:company, segments: 'Motors', products: 'bike', plan: 'none') }
		let!(:company2) { FactoryGirl.create(:company, segments: 'Sports', products: 'ball', plan: 'plus') }
		let!(:company3) { FactoryGirl.create(:company, segments: 'Movies', products: 'dvds', plan: 'plus') }

		context "without word list" do
			it "should return maximum 12 random companies" do
				Search.perform_with.count.should <= 12
			end
		end

		context "with word list" do
			it "should save a search information and words list as tags" do
				Search.perform_with('word')
				Search.first.words.first.should be_a(ActsAsTaggableOn::Tag)
			end

			it "should save founded companies as search results" do
				Search.perform_with('bike ball')
				Search.first.companies.should include(company1, company2)
			end

			it "should return companies ordered by relevance" do
				Search.perform_with('motors bike sports dvds').should == [company3, company2, company1]
				Search.perform_with('motors bike ball movies').should == [company2, company3, company1]
			end

			it "should return nothing if none company is founded" do
				Search.perform_with('icecream').should be_empty
			end
		end
	end
end