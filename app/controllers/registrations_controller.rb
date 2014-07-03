class RegistrationsController < Devise::RegistrationsController  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :zip, :birthdate, :humanizer_answer, :humanizer_question_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :zip, :current_password, :profile_img, :rate, :unit) }
  end
  
  
end
