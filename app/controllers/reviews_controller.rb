class ReviewsController < ApplicationController
  before_action :set_article


  def new
    @review = Review.new
    @review.article = @article
    @category = Category.find(params[:category_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.article = @article
    @category = Category.find(params[:category_id])
    if @review.save
      redirect_to category_articles_path
    else
      redirect_to articles_path(@article)
      flash[:alert] = "Minimum of 10 characteres."
    end
  end



  private

  def review_params
    params.require(:review).permit(:content, :article_id, :category_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
  # def set_category
  #   @category = Category.find(params[:category_id])
  # end
end


