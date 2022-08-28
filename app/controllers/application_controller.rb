class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?   #追加部分
  protect_from_forgery with: :exception


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
