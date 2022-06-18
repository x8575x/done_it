class Admin::DifficultiesController < ApplicationController
  layout 'admin/application'

  def create
    @difficulty = Difficulty.new(difficulty_params)
    if @difficulty.save
      flash[:notice] = "登録しました"
      redirect_to admin_difficulties_path
    else
      render :index
    end
  end

  def edit
    @difficulty = Difficulty.find(params[:id])
  end
  
  def index
    @difficulty = Difficulty.new
    @difficulties = Difficulty.all
  end

  def update
    @difficulty = Difficulty.find(params[:id])
    if @difficulty.update(difficulty_params)
    flash[:notice] = "編集に成功しました"
      redirect_to admin_difficulties_path
    else
      render :index
    end
  end

  def destroy
    @difficulty = Difficulty.find(params[:id])
    if @difficulty.destroy
      flash[:notice] = "削除"
      redirect_to admin_difficulties_path
    else
      render :index
    end
  end



  private

  def difficulty_params
    params.require(:difficulty).permit(:name)
  end

end
