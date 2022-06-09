class Admin::MysteriesController < ApplicationController
  layout 'admin/application'

  def create
    @mystery = Mystery.new(mystery_params)
    @mystery.save
    redirect_to admin_top_path
  end

  def edit
    @mystery = Mystery.find(params[:id])
  end

  def update
    @mystery = Mystery.find(params[:id])
    @mystery.update(mystery_params)
    redirect_to admin_top_path
  end

  def destroy
    @mystery = Mystery.find(params[:id])
    @mystery.destroy
    redirect_to admin_top_path
  end



  private

  def mystery_params
    params.require(:mystery).permit(:name)
  end

end
