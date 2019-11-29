class ReactionsController < ApplicationController
  before_action :set_article
  before_action :set_category

  # def create
  #   @reaction = Reaction.new(reaction_params)
  #   @reaction.user = current_user
  #   @reaction.article = @article

  #   if @reaction.save
  #     redirect_to article_path(@article)
  #   else
  #     redirect_to article_path(@article)
  #   end
  # end

  # def create
  #   @user = current_user.id
  #   @product = params[:product_id]
  #   likes = {user_id: @user, product_id: @product}
  #   @like = Like.new(likes)

  #   @like.save!
  #   if @like.save
  #     redirect_to user_path(@user)
  #   else
  #    redirect_to product_path
  #   end
  # end

  def love
    if current_user.loved?(@article)
      @reaction = @article.reactions.find_by(user: current_user)
      @reaction.destroy
      redirect_to category_article_path(@category, @article)
    else
      @reaction = Reaction.new(reaction: "love")
      @reaction.user = current_user
      @reaction.article = @article
      @reaction.save
      flash[:success] = "Upvoted Comment!"
      redirect_to category_article_path(@category, @article)
    end
  end


  def save
    if current_user.saved?(@article)
    @reaction = @article.reactions.find_by(user: current_user)
    @reaction.destroy
    redirect_to category_article_path(@category, @article)
  else
    @reaction = Reaction.new(reaction: "save")
    @reaction.user = current_user
    @reaction.article = @article
    @reaction.save
    flash[:success] = "Upvoted Comment!"
    redirect_to category_article_path(@category, @article)
    end
  end


  def wtt
    if current_user.wtted?(@article)
    @reaction = @article.redirect_find_by(user: current_user)
    @reaction.destroy
    redirect_to category_article_path(@category, @article)
  else
    @reaction = Reaction.new(reaction: "want_to_try")
    @reaction.user = current_user
    @reaction.article = @article
    @reaction.save
    flash[:success] = "Upvoted Comment!"
    redirect_to category_article_path(@category, @article)
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end


