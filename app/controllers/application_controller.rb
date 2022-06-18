class ApplicationController < ActionController::Base

  # adminが含まれるURLはログインしないと見れない
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  # メールアドレス以外も登録可能にする
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def configure_permitted_parameters

    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :birthday, :sex, :introduction, :profile_image, :mystery_active, :birthday_active, :sex_active])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:email, :name, :birthday, :sex, :introduction, :pro])
    else #Adminの場合
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end

end
