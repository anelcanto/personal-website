require 'rails_helper'

RSpec.describe "leads/show", type: :view do
  before(:each) do
    assign(:lead, Lead.create!(
      name: "Name",
      email: "Email",
      phone_number: "Phone Number",
      details: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/MyText/)
  end
end
