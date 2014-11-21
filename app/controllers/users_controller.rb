class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
    @partner = User.find(params[:id])
    @activities = Activity.all
  end

end
