FactoryGirl.define do
  factory :company do
    name     'Company Name'
    phone    '24 2452 2222'
    address  'Company Address, 11, 111'
    segments 'Segment, List'
    products 'product, tags'
    username 'company-name'
    plan     'none'
  end

  factory :lead do
    company_name 'Company Name'
    contact_name 'Contact Name'
    email        'email@example.com'
  end
end