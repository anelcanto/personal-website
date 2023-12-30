require 'rails_helper'

RSpec.describe "leads/index", type: :view do
  before(:each) do
    assign(:leads, [
      Lead.create!(
        name: "Name",
        email: "Email",
        phone_number: "Phone Number",
        details: "MyText"
      ),
      Lead.create!(
        name: "Name",
        email: "Email",
        phone_number: "Phone Number",
        details: "MyText"
      )
    ])
  end

  it "renders a list of leads" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
