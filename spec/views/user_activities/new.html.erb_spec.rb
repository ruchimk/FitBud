require 'rails_helper'

RSpec.describe "user_activities/new", :type => :view do
  before(:each) do
    assign(:user_activity, UserActivity.new(
      :user_id => 1,
      :activity_id => 1
    ))
  end

  it "renders new user_activity form" do
    render

    assert_select "form[action=?][method=?]", user_activities_path, "post" do

      assert_select "input#user_activity_user_id[name=?]", "user_activity[user_id]"

      assert_select "input#user_activity_activity_id[name=?]", "user_activity[activity_id]"
    end
  end
end
