class RegistrationsController < Devise::RegistrationsController

  private
  
  def sign_up_params
  	params.require(:user).permit(:username, :email, :password,
  	 :password_confirmation, :first_name, :last_name, :age)
  end
  
  def account_update_params
    params.require(:user).permit(:username, :email, :password,
     :password_confirmation, :current_password, :first_name, :last_name, :age)
  end
end

	