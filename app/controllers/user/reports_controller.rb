class User::ReportsController < ApplicationController

  def new
    @report = Report.new
    @review_id = params[:review_id]
    # 前ページセッションを保存
    session[:previous_url] = request.referer
  end

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



  private

  def report_params
    params.require(:report).permit(:user_id, :review_id, :category, :comment)
  end



end
