class UsersController < ApplicationController
  def show
    @user = current_user
    # @partner = User.find(params[:id])
    # #when user is current user
    # @requests = Match.where(user_id: @user.id, status: 'requested')

    # @activities = Activity.all
  end

  end
end