require 'rails_helper'

RSpec.describe "leads/edit", type: :view do
  let(:lead) {
    Lead.create!(
      name: "MyString",
      email: "MyString",
      phone_number: "MyString",
      details: "MyText"
    )
  }

  before(:each) do
    assign(:lead, lead)
  end

  it "renders the edit lead form" do
    render

    assert_select "form[action=?][method=?]", lead_path(lead), "post" do

      assert_select "input[name=?]", "lead[name]"

      assert_select "input[name=?]", "lead[email]"

      assert_select "input[name=?]", "lead[phone_number]"

      assert_select "textarea[name=?]", "lead[details]"
    end
  end
end
