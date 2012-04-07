# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Search do
	describe "mass assignment security" do
		it { should allow_mass_assignment_of(:term_list) }
	end

	describe "validations" do
		it { should validate_presence_of(:term_list)}
	end

	describe "bring me results for" do
		context "with term list" do
			it "should save a search information" do
				expect do
					Search.bring_me_results_for('term, list')
				end.to change(Search, :count).by(1)
			end

			let!(:company) { Factory(:company, name_list: 'petit marché') }
			let!(:company1) { Factory(:company, segment_list: 'motors', product_list: 'bike') }
			let!(:company2) { Factory(:company, segment_list: 'sports', product_list: 'ball') }

			it "should return companies filtered by term list" do
				Search.bring_me_results_for('bike, ball').should include(company1, company2)
				Search.bring_me_results_for('bike, ball').should_not include(company)
			end

			it "should return companies filtered by term list ignoring accents" do
				Search.bring_me_results_for('petít').should include(company)
				Search.bring_me_results_for('marche').should include(company)
			end

			it "should return companies ordered by relevance" do
				Search.bring_me_results_for('motors, bike, ball').should == [company1, company2]
				Search.bring_me_results_for('sports, bike, ball').should == [company2, company1]
			end

			it "should return empty array if not found any company with term list" do
				Search.bring_me_results_for('icecream').should be_a(Array)
				Search.bring_me_results_for('icecream').should be_empty
			end
		end

		context "without term list" do
			it "should return maximum 12 random companies" do
				15.times { Factory(:company) }
				Search.bring_me_results_for.count.should <= 12
			end
		end
	end

	describe "filter terms" do
		it "should remove blacklist's words from search terms" do
			Search.filter_terms('should, not, include, do').should == 'should, not, include'
		end

		it "should return nil if none terms passed" do
			Search.filter_terms.should be_nil
		end
	end
end