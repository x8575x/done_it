class Admin::HomesController < ApplicationController
  layout 'admin/application'

  def top
    @reports = Report.all.order(created_at: :desc).page(params[:page]).per(15)
  end

end
