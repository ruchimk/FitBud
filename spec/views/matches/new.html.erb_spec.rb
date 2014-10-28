require 'rails_helper'

RSpec.describe "matches/new", :type => :view do
  before(:each) do
    assign(:match, Match.new(
      :user_id => 1,
      :partner_id => 1,
      :message => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_user_id[name=?]", "match[user_id]"

      assert_select "input#match_partner_id[name=?]", "match[partner_id]"

      assert_select "input#match_message[name=?]", "match[message]"

      assert_select "input#match_status[name=?]", "match[status]"
    end
  end
end
