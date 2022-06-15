# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController

  before_action :user_state, only: [:create]

  protected

  # 退会済みか判断
  def user_state
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    ## もし@userのis_deletedが(!true=false)なら下の処理へ、(!false=true)ならreturnへ
    return if !@user
    ## 取得したアカウントのパスワードと入力されたパスワードが一致（true）　かつ　is_deletedがfalse(退会していない)
    if @user.valid_password?(params[:user][:password]) && !(@user.is_deleted?)
    ## (!false=true）だった場合、退会していないのでcreateを実行
    else
    ## !true（false）だった場合、退会済みなのでサインアップ画面に遷移
      redirect_to new_user_registration_path
    end
  end




  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
