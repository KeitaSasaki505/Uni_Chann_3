class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :nickname, :name_kanji, :name_kana])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :nickname, :name_kanji, :name_kana])
  end
end
