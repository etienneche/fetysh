class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def show
    @user = current_user
    @reviews = Review.all.where("article_id = ?", @article.id)
    @reactions = Reaction.all.where("reaction_id = ?", @reaction.id)
    @review = Review.new
  end

  def new
    @article = Article.new
  end

  def create
    @article. Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article), notice: 'The article was successfully created.'
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
    params.require(:article).permit(:title, :content, :source)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end



