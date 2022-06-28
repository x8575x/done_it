class Admin::LongsController < ApplicationController
  layout 'admin/application'

  def create
    @long = Long.new(long_params)
    if @long.save
    flash[:notice] = "登録しました"
      redirect_to admin_longs_path
    else
      @longs = Long.all
      render :index
    end
  end

  def edit
    @long = Long.find(params[:id])
  end

  def update
    @long = Long.find(params[:id])
    if @long.update(long_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_longs_path
    else
      render :edit
    end
  end

  def index
    @long = Long.new
    @longs = Long.all.page(params[:page]).per(30)
  end

  def destroy
    @long = Long.find(params[:id])
    if @long.destroy
      flash[:notice] = "削除しました"
      redirect_to admin_longs_path
    else
      render :index
    end
  end



  private

  def long_params
    params.require(:long).permit(:name)
  end

end
