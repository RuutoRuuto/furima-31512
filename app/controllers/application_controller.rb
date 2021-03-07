class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_FURIMA"] && password == ENV["BASIC_AUTH_PASSWORD_FURIMA"]
    end
  end

  def configure_permitted_parameters
    key_array = [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :birthday]
    devise_parameter_sanitizer.permit(:sign_up, keys: key_array)
  end
end
