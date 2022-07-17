class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @review = Review.new
    # 検索フォームのisbnの引き継ぎ
    @isbn = params[:isbn]
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to review_path(@review.id)
    else
      @isbn = @review.book_id
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを編集しました"
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.destroy
      flash[:notice] = "レビューを削除しました"
      redirect_to user_path(current_user.id)
    else
      render :index
    end
  end

  def index
    @user = User.find(params[:user_id])
    @reviews = Review.where(user_id: params[:user_id]).order(created_at: :desc).page(params[:page]).per(15)
  end

  def search
    @search_params = review_search_params
    @reviews = Review.search(@search_params).page(params[:page]).per(10)
  end


  private

  def review_params
    params.require(:review).permit(
      :book_id,:body, :netabare, :type_id, :long_id,
      # Mystery,Difficulty,Tagの配列で複数保存
      { :mystery_ids => [] }, { :difficulty_ids => [] }, { :tag_ids => [] }
    )
  end

  def review_search_params
    return unless params[:search]
    search_params = params.require(:search).permit(:type_id, :long_id, :mystery_ids => [], :difficulty_ids => [], :tag_ids => [])
    # 検索時の配列でmystery_ids,difficulty_ids,tag_idsのnillを無視する記述
    %i[mystery_ids difficulty_ids tag_ids].each do |ids|
      search_params[ids] = search_params[ids]&.reject(&:blank?)
    end
    search_params
  end


end
