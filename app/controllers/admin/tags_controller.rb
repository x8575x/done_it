class Admin::TagsController < ApplicationController
  layout 'admin/application'

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_top_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to admin_top_path
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_top_path
  end



  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
