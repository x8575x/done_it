class Admin::DifficultiesController < ApplicationController
  layout 'admin/application'

  def create
    @difficulty = Difficulty.new(difficulty_params)
    @difficulty.save
    redirect_to admin_top_path
  end

  def edit
    @difficulty = Difficulty.find(params[:id])
  end

  def update
    @difficulty = Difficulty.find(params[:id])
    @difficulty.update
    redirect_to admin_top_path
  end

  def destroy
    @difficulty = Difficulty.find(params[:id])
    @difficulty.destroy
    redirect_to admin_top_path
  end
  
  
  
  private

  def difficulty_params
    params.require(:difficulty).permit(:name)
  end

end
