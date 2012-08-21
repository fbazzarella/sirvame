require 'spec_helper'

describe ApplicationHelper do
	describe "default title" do
		it "should return anything" do
			default_title.should be_a(String)
			default_title.should_not be_blank
		end
	end

	describe "default description" do
		it "should return anything" do
			default_description.should be_a(String)
			default_description.should_not be_blank
		end

		it "should have less than 155 chars" do
			default_description.length.should <= 155
		end
	end

	describe "default og image" do
		it "should return anything" do
			default_og_image.should be_a(String)
			default_og_image.should_not be_blank
		end
	end

	describe "normalize search params" do
		it "should return with comma separator" do
			normalize_search_params('first+second').should == 'first, second'
		end

		it "should remove unecessary separator" do
			normalize_search_params('+first+second').should == 'first, second'
			normalize_search_params('+').should be_nil
		end

		it "should return nothing if no param is passed" do
			normalize_search_params.should be_nil
		end
	end

	describe "account token for" do
		it "should return a token string for analytics" do
			account_token_for(:analytics).should be_a(String)
			account_token_for(:analytics).should_not be_blank
		end

		it "should return a token string for mixpanel" do
			account_token_for(:mixpanel).should be_a(String)
			account_token_for(:mixpanel).should_not be_blank
		end

		it "should return a token string for addthis" do
			account_token_for(:addthis).should be_a(String)
			account_token_for(:addthis).should_not be_blank
		end

		it "should return nil if service token don't exists" do
			account_token_for(:other).should be_nil
		end

		it "should return nil if none service passed" do
			account_token_for.should be_nil
		end
	end
end