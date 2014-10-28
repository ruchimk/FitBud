require 'rails_helper'

RSpec.describe "matches/edit", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :user_id => 1,
      :partner_id => 1,
      :message => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_user_id[name=?]", "match[user_id]"

      assert_select "input#match_partner_id[name=?]", "match[partner_id]"

      assert_select "input#match_message[name=?]", "match[message]"

      assert_select "input#match_status[name=?]", "match[status]"
    end
  end
end
