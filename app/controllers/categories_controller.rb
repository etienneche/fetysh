class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    authorize @category
    if @category.save
      redirect_to categorys_path(@category)
    else
      flash[:alert] = "The category must be precise"
      redirect_to
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Fetysh category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Fetysh category was successfully destroyed.'
  end

  private

  def sey_category
    @category = Category.find(params[:id])
  end
end
