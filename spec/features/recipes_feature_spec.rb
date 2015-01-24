require 'rails_helper'

feature "Recipes" do

  let(:recipe) { create(:recipe) }
  let(:new_recipe) { build(:recipe, :name => "Cereal", :serving_size => 1) }

  scenario "Admin creates a new recipe" do
    visit recipes_path
    click_link "New Recipe"

    expect(current_path).to eql(new_recipe_path)

  	fill_in "Name", with: new_recipe.name
  	fill_in "Serving size", with: new_recipe.serving_size

  	Recipe.should_receive(:new).and_return(new_recipe)

  	click_button "Create Recipe"

    expect(page).to have_text("\"#{new_recipe.name}\" was successfully created")
    expect(current_path).to eql(recipe_path(new_recipe))
  end

  scenario "Admin edits a recipe" do
    visit recipe_path(recipe)
    click_link "Edit"

    expect(current_path).to eql(edit_recipe_path(recipe))

    fill_in "Name", with: "A different name!"

    click_button "Update Recipe"
    recipe.reload

    expect(page).to have_text("\"#{recipe.name}\" was successfully updated")
    expect(current_path).to eql(recipe_path(recipe))
  end

  scenario "Admin deletes a recipe" do
    visit recipe_path(recipe)
    click_button "Delete"

    expect(page).to have_text("\"#{recipe.name}\" was successfully deleted")
    expect(current_path).to eql(recipes_path)
  end

end
