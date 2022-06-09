class Admin::TypesController < ApplicationController
  layout 'admin/application'


  def create
    @type = Type.new(type_params)
    @type.save
    redirect_to admin_top_path
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])
    @type.update(type_params)
    redirect_to admin_top_path
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to admin_top_path
  end



  private

  def type_params
    params.require(:type).permit(:name)
  end

end
