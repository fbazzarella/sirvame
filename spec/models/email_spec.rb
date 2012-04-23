require 'spec_helper'

describe Email do
	describe "mass assignment security" do
		[:name, :email].each do |attr|
			it { should allow_mass_assignment_of(attr) }
		end
	end

	describe "validations" do
		[:name, :email].each do |attr|
			it { should validate_presence_of(attr) }
		end
	end
end