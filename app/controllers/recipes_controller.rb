class RecipesController < ApplicationController
	expose(:recipes)
	expose(:recipe, attributes: :recipe_params)

  def index
  end

	def new
	end

  def create
  	if recipe.save
	  	redirect_to recipe
	  else
	  	render action: :new
	  end
  end

  def show
  end

  def edit
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :queued_for, :serving_size)
  end

end
