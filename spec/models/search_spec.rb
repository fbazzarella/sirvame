# encoding: utf-8
require 'spec_helper'

describe Search do
	describe "mass assignment security" do
		it { should allow_mass_assignment_of(:terms) }
	end

	describe "validations" do
		it { should validate_presence_of(:terms) }
	end

	describe "class methods" do
		describe "bring me results for" do
			10.times        { FactoryGirl.create(:company) }

			let!(:company)  { FactoryGirl.create(:company, name: 'Petit Marché') }
			let!(:company1) { FactoryGirl.create(:company, segments: 'Motors', products: 'bike') }
			let!(:company2) { FactoryGirl.create(:company, segments: 'Sports', products: 'ball') }

			context "without term list" do
				it "should return maximum 12 random companies" do
					Search.perform_with.count.should <= 12
				end
			end

			context "with term list" do
				it "should save a search information" do
					expect do
						Search.perform_with('term, list')
					end.to change(Search, :count).by(1)
				end

				it "should return companies filtered by term list" do
					Search.perform_with('bike, ball').should include(company1, company2)
					Search.perform_with('bike, ball').should_not include(company)
				end

				it "should return companies filtered by term list ignoring accents" do
					Search.perform_with('petít').should include(company)
					Search.perform_with('marche').should include(company)
				end

				xit "should return companies ordered by relevance" do
					Search.perform_with('motors, bike, ball').should == [company1, company2]
					Search.perform_with('sports, bike, ball').should == [company2, company1]
				end

				it "should return empty array if not found any company with term list" do
					Search.perform_with('icecream').should be_a(Array)
					Search.perform_with('icecream').should be_empty
				end
			end
		end

		describe "filter terms" do
			it "should remove blacklist's words from search terms" do
				Search.send(:filter_terms, 'should, not, include, do').should == 'should, not, include'
			end

			it "should return nil if none terms passed" do
				Search.send(:filter_terms).should be_nil
			end
		end
	end
end