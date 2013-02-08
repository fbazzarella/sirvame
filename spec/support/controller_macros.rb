module ControllerMacros
  def simule_page_for_company!
    let(:company) { FactoryGirl.create(:company) }
    let(:fixture) { Rails.root.join('spec/fixtures', 'home.html.erb') }
    let(:to_dir)  { Rails.root.join("app/views/companies/#{company.username}") }

    before { FileUtils.cp(fixture, FileUtils.mkdir_p(to_dir).join) }
    after  { FileUtils.rm_r(to_dir) }
  end
end
