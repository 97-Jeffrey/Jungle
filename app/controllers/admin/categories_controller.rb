class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name:ENV["AD_USER"], password:ENV["AD_PASSWORD"],
  except: [:index]

  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created'
    else
      render :new
    end
  end
end
