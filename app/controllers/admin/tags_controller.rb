class Admin::TagsController < ApplicationController
  layout 'admin/application'

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "登録しました"
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "編集に成功しました"
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
    flash[:notice] = "削除"
      redirect_to admin_tags_path
    else
      render :index
    end
  end



  private

  def tag_params
    params.require(:tag).permit(:name, :introduction)
  end

end
