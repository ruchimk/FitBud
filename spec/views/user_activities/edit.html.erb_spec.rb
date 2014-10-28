require 'rails_helper'

RSpec.describe "user_activities/edit", :type => :view do
  before(:each) do
    @user_activity = assign(:user_activity, UserActivity.create!(
      :user_id => 1,
      :activity_id => 1
    ))
  end

  it "renders the edit user_activity form" do
    render

    assert_select "form[action=?][method=?]", user_activity_path(@user_activity), "post" do

      assert_select "input#user_activity_user_id[name=?]", "user_activity[user_id]"

      assert_select "input#user_activity_activity_id[name=?]", "user_activity[activity_id]"
    end
  end
end
