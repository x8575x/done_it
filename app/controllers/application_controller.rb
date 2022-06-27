class ApplicationController < ActionController::Base

  # adminが含まれるURLはログインしないと見れない
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  # メールアドレス以外も登録可能にする
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource.is_a?(Admin)
      admin_top_path(sort: 'false')
    else
      user_path(current_user)
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters

    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :birthday, :sex, :introduction, :profile_image, :mystery_active, :birthday_active, :sex_active])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:email, :name, :birthday, :sex, :introduction, :profile_image, :mystery_active, :birthday_active, :sex_active])
    else #Adminの場合
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end

end
