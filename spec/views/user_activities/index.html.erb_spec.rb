require 'rails_helper'

RSpec.describe "user_activities/index", :type => :view do
  before(:each) do
    assign(:user_activities, [
      UserActivity.create!(
        :user_id => 1,
        :activity_id => 2
      ),
      UserActivity.create!(
        :user_id => 1,
        :activity_id => 2
      )
    ])
  end

  it "renders a list of user_activities" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
