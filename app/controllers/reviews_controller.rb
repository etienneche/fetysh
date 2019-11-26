class ReviewsController < ApplicationController
  before_action :set_review, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.article = @article

    if @review.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
      flash[:alert] = "Minimum of 10 characteres."
    end
  end

  def new
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end


