class RecipesController < ApplicationController
	expose(:recipes)
	expose(:recipe, attributes: :recipe_params)

  def create
  	if recipe.save
	  	redirect_to recipe
      flash[:success] = "\"#{recipe.name}\" was successfully created"
	  else
	  	render action: :new
	  end
  end

  def update
    if recipe.save
      redirect_to recipe
      flash[:success] = "\"#{recipe.name}\" was successfully updated"
    else
      render action: :edit, id: recipe.id
    end
  end

  def destroy
    if recipe.destroy
      redirect_to recipes_path
      flash[:success] = "\"#{recipe.name}\" was successfully deleted"
    else
      render recipe
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :queued_for, :serving_size)
  end

end
