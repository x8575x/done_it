class User::ReportsController < ApplicationController

  # 通報機能用のビュー
  def new
    @report = Report.new
    @review_id = params[:review_id]
    # 前ページセッションを保存
    session[:previous_url] = request.referer
  end
  
  # 通報機能用のcreate
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      flash[:notice] = "通報しました"
      # create後にnewの前ページに遷移
      redirect_to session[:previous_url]
    else
      render :new
    end
  end
  

  # タグ新規依頼用のビュー  
  def new_tag
    @report = Report.new
    # 前ページセッションを保存
    session[:previous_url] = request.referer
  end
  
  # タグ新規依頼用のcreate
  def new_tag_create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      flash[:notice] = "作成依頼を受け付けました"
      # create後にnewの前ページに遷移
      redirect_to session[:previous_url]
    else
      render :new_tag
    end
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :review_id, :category, :comment)
  end



end
