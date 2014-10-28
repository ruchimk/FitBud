class UserActivitiesController < ApplicationController

  def create
    user = current_user
    activity = Activity.find(params[:activity_id])
    new_activity = current_user.user_activities.build(activity: activity)
    if activity == current_user.user_activities
      redirect_to activity_path(activity)
    elsif new_activity.save
      flash[:success] = "Successfully added #{activity.name} as your favorite activity..."
      redirect_to activity_path(activity)
    else
      flash[:error] = "Whoops, something went wrong..."
      redirect_to activities_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @activity = activity.find(params[:id])

    @association = UsersActivity.remove_activity
  end

end




