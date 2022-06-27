class Admin::HomesController < ApplicationController
  layout 'admin/application'

  def top
    @reports = Report.where(is_active: params[:sort]).order(created_at: :desc).page(params[:page]).per(15)
  end

end
