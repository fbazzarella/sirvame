require 'spec_helper'

describe ApplicationHelper do
	describe "page title" do
		it "should return anything" do
			page_title.should be_a(String)
			page_title.should_not be_blank
		end

		it "should render a custom title" do
			page_title('Custom Title').should == 'Custom Title - Sirva.me'
		end
	end

	describe "page description" do
		it "should return anything" do
			page_description.should be_a(String)
			page_description.should_not be_blank
		end

		it "should render a custom description" do
			page_description('Custom Description').should == 'Custom Description'
		end

		it "should have maximum 155 chars" do
			page_description.length.should <= 155
		end
	end

	describe "og image" do
		it "should return anything" do
			og_image.should be_a(String)
			og_image.should_not be_blank
		end

		it "should render a custom og image" do
			og_image('custom_image.png').should =~ /custom_image.png/
		end
	end

	describe "default contact email" do
		it "should return default email link tag" do
			default_contact_email.should == "<a href=\"mailto:fbazzarella@gmail.com\" title=\"Envie-nos um e-mail. Ficaremos felizes!\">fbazzarella@gmail.com</a>"
		end

		it "should return email link tag with a custom label and css class" do
			default_contact_email('Custom Label', :custom_class).should == "<a class=\"custom_class\" href=\"mailto:fbazzarella@gmail.com\" title=\"Envie-nos um e-mail. Ficaremos felizes!\">Custom Label</a>"
		end
	end

	describe "back to catalog path" do
		it "should return a javascript path" do
			back_to_catalog_path({encontrar: 'first+second', format: 'js'}).should == '/#!/encontrar/first+second'
		end

		it "should return a normal path" do
			back_to_catalog_path({encontrar: 'first+second'}).should == '/?encontrar=first+second'
		end

		it "should return root path" do
			back_to_catalog_path.should == root_path
			back_to_catalog_path({encontrar: ''}).should == root_path
		end
	end

	describe "normalize search params" do
		it "should return with space separator" do
			sanitize('first+second', :go).should == 'first second'
		end

		it "should return with plus separator" do
			sanitize('first, second third', :back).should == 'first+second+third'
		end

		it "should remove unecessary separators" do
			sanitize('+first+second', :go).should == 'first second'
			sanitize(', first, second third', :back).should == 'first+second+third'

			sanitize('+', :go).should be_nil
			sanitize(', ', :back).should be_nil
		end

		it "should return nothing if no param is passed" do
			sanitize.should be_nil
		end
	end

	describe "account token for" do
		it "should return a token string for analytics" do
			account_token_for(:analytics).should be_a(String)
			account_token_for(:analytics).should_not be_blank
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
