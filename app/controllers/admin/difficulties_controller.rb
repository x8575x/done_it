class Admin::DifficultiesController < ApplicationController
  layout 'admin/application'

  def create
    @difficulty = Difficulty.new(difficulty_params)
    @difficulty.save
  end

  def edit
    @difficulty = Difficulty.find(params[:id])
  end

  def update
    @difficulty = Difficulty.find(params[:id])
    @difficulty
  end

  def delete
    @difficulty = Difficulty.find(params[:id])
    @difficulty.destroy
  end
  
  
  
  private

  def difficulty_params
    params.require(:difficulty).permit(:name)
  end

end
