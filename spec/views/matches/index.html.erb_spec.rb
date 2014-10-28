require 'rails_helper'

RSpec.describe "matches/index", :type => :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :user_id => 1,
        :partner_id => 2,
        :message => "Message",
        :status => "Status"
      ),
      Match.create!(
        :user_id => 1,
        :partner_id => 2,
        :message => "Message",
        :status => "Status"
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
