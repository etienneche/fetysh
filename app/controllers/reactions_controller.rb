class ReactionsController < ApplicationController
  before_action :set_reaction, only: [:create]

  def create
    @reaction = Reaction.new(reaction_params)
    @reaction.user = current_user
    @reaction.article = @article

    if @reaction.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  def new
    @reaction = Reaction.new
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reaction)
  end

  def set_reaction
    @reaction = Reaction.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end

end


