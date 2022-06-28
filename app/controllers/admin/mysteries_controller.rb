class Admin::MysteriesController < ApplicationController
  layout 'admin/application'

  def create
    @mystery = Mystery.new(mystery_params)
    if @mystery.save
      flash[:notice] = "登録しました"
      redirect_to admin_mysteries_path
    else
      @mysteries = Mystery.all
      render :index
    end
  end

  def edit
    @mystery = Mystery.find(params[:id])
  end
  
  def index
    @mystery = Mystery.new
    @mysteries = Mystery.all.page(params[:page]).per(30)
  end

  def update
    @mystery = Mystery.find(params[:id])
    if @mystery.update(mystery_params)
      flash[:notice] = "編集に成功しました"
    redirect_to admin_mysteries_path
    else
      render :edit
    end
  end

  def destroy
    @mystery = Mystery.find(params[:id])
    if @mystery.destroy
      flash[:notice] = "削除しました"
      redirect_to admin_mysteries_path
    else
      render :index
    end
  end



  private

  def mystery_params
    params.require(:mystery).permit(:name)
  end

end
