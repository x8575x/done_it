class Admin::LongsController < ApplicationController
  layout 'admin/application'

  def create
    @long = Long.new(long_params)
    @long.save
    redirect_to admin_top_path
  end

  def edit
    @long = Long.find(params[:id])
  end

  def update
    @long = Long.find(params[:id])
    @long.update(long_params)
    redirect_to admin_top_path
  end

  def destroy
    @long = Long.find(params[:id])
    @long.destroy
    redirect_to admin_top_path
  end



  private

  def long_params
    params.require(:long).permit(:name)
  end

end
