# encoding: utf-8
require 'spec_helper'

describe "Main Navigation" do
  it "should display catalog" do
    visit new_lead_path
    click_link 'Página Inicial'

    page.should have_content('Encontre o que precisa')
  end

  it "should display new leads page" do
    visit root_path
    click_link 'Anuncie Grátis'

    page.should have_content('Em qualquer lugar. A qualquer hora.')
  end

  xit "should display questions page" do
    visit root_path
    click_link 'Ajuda'

    page.should have_content('Tire Suas Dúvidas')
  end
end
