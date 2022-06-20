class Admin::TypesController < ApplicationController
  layout 'admin/application'


  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:notice] = "登録しました"
      redirect_to admin_types_path
    else
      @types = Type.all
      render :index
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def index
    @type = Type.new
    @types = Type.all
  end

  def update
    @type = Type.find(params[:id])
    if @type.update(type_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_types_path
    else
      render :edit
    end
  end

  def destroy
    @type = Type.find(params[:id])
    if @type.destroy
      flash[:notice] = "削除しました"
      redirect_to admin_types_path
    end
  end



  private

  def type_params
    params.require(:type).permit(:name)
  end

end
