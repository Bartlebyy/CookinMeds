require 'rails_helper'

feature "Recipes" do

  let(:new_recipe) { build(:recipe, :name => "Cereal", :serving_size => 1) }

  scenario "Admin creates a new recipe" do
  	visit new_recipe_path

  	fill_in "Name", with: new_recipe.name
  	fill_in "Serving size", with: new_recipe.serving_size

  	Recipe.should_receive(:new).and_return(new_recipe)

  	click_button "Create Recipe"

    expect(page).to have_text("Recipe was successfully created")
    expect(current_path).to eql(recipe_path(new_recipe)) # TODO: fix path
  end

  scenario "Admin edits a recipe" do
  	# visit new_recipe_path

  	# fill_in "Name", with: "Cereal"
  	# fill_in "Serving size", with: 1

  	# click_button "Create Recipe"

   #  expect(page).to have_text("Recipe was successfully created")
   #  expect(current_path).to eql(recipe_path(Recipe.last)) # TODO: fix path
  end


end