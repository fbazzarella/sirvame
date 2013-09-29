require 'spec_helper'

describe Lead do
  before { visit new_lead_path }

  it "should display effectived lead page with valid params" do
    fill_in 'lead_company_name', with: 'Company Name'
    fill_in 'lead_contact_name', with: 'Contact Name'
    fill_in 'lead_email',        with: 'email@example.com'
    click_button 'Quero Experimentar »'

    page.should have_content('Sábia decisão :D')
  end

  it "should display new page with validation errors" do
    click_button 'Quero Experimentar »'

    page.should have_content('Este campo deve ser preenchido.')
  end
end
