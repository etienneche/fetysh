class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  before_action :set_category, only: [:show]

  def index
    @articles = Article.all
  end

  def show
    @user = current_user
    @article_love_count = @article.reactions.where(reaction: 'love').count
    @article_save_count = @article.reactions.where(reaction: 'save').count
    @article_wtt_count = @article.reactions.where(reaction: 'wtt').count
    @reviews = Review.where("article_id = ?", @article.id)
    @review = Review.new
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    @category = @article.category

    if @article.save
      redirect_to category_articles_path(@category), notice: 'The article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'The article was successfully updated.'
    else
      render :exit
    end
  end

  def destroy
    @article.destroy
    redirect_to reviews_path, notice: 'The article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :source, :category_id, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end

