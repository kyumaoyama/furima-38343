class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?   #追加部分
  
  
  private
  def configure_permitted_parameters
   
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password ,:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date])
  end


  private
  def production?   #追加部分〜
    Rails.env.production?
  end   #〜追加部分

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
