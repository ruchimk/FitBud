
class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:avatar, :username,:email, :password, :password_confirmation, :location, :age, :goals, :admin?)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :username, :email, :password, :password_confirmation, :current_password, :location, :zip_code, :age, :goals, :admin?)
  end

end
