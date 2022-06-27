class Admin::ReportsController < ApplicationController
  layout 'admin/application'

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_top_path(@report)
    else
      render :show
    end
  end


  private


  def report_params
    params.require(:report).permit(:is_active)
  end

end
