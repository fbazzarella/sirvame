require 'spec_helper'

describe "Main Navigation" do
  xit "should display catalog" do
    visit new_lead_path
    click_link 'Página Inicial'

    page.should have_content('Encontre o que precisa')
  end

  xit "should display new leads page" do
    visit root_path
    click_link 'Anuncie Grátis'

    page.should have_content('Em qualquer lugar. A qualquer hora.')
  end
end
