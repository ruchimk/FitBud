class UserActivitiesController < ApplicationController

  def create
    user = current_user
    activity = Activity.find(params[:activity_id])
    new_activity = user.user_activities.build(activity: activity)
    if new_activity.save
      flash[:success] = "Successfully added to #{activity.name} room..."
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




