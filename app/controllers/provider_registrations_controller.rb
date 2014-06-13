class ProviderRegistrationsController < Devise::RegistrationsController

  private
  
  def sign_up_params
  	params.require(:provider).permit(:username, :email, :password,
  	 :password_confirmation, :first_name, :last_name, :age)
  end
  
  def account_update_params
    params.require(:provider).permit(:username, :email, :password,
     :password_confirmation, :current_password, :first_name, :last_name, :age)
  end
  
end
