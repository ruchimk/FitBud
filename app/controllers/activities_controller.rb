class ActivitiesController < ApplicationController
  # before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    @methods = User.methods
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
      @activity = Activity.find(params[:id])
    # @users = User.user_activities.where(:activity_id, @activity.id)
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        redirect_to @activity
        # format.json { render :show, status: :created, location: @activity }
      else
        render 'new'
        # format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity = Activity.update(activity_params)
    if @activity.save
      redirect_to @activity
    else
      render 'edit'
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Acivitiy.find(params[:id]).destroy
    # respond_to do |format|
    #   format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
    #   format.json { head :no_content }
  end

  def admin
    @user = User.find(params[:id])
    @user.admin
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    unless @activity = current_user.activites.where(id: params[:id]).first
      flash[:alert] = 'Activity not found.'
      redirect_to root_url
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:name)
  end

end
