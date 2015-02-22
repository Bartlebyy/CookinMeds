require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do

  let(:recipe) { create(:recipe, :with_steps, :with_ingredients) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: recipe.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: recipe.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    let(:new_recipe) { build_stubbed(:recipe, :with_steps) }
    let(:recipe_params) { new_recipe.attributes.symbolize_keys }
    let(:step_count) { new_recipe.steps.count }
    let(:ingredient_count) { new_recipe.ingredients.count }

    let(:creating_a_recipe) { post :create, recipe: recipe_params }

    it "creates a recipe" do
      expect { creating_a_recipe }.to change(Recipe, :count).by(1)
    end

    it "creates all steps for that recipe" do
      expect { creating_a_recipe }.to change(Step, :count).by(step_count)
    end

    it "creates all ingredients for that recipe" do
      expect { creating_a_recipe }.to change(Ingredient, :count).by(ingredient_count)
    end
  end

  describe "PUT update" do
    let(:name) { "A different name!" }
    let(:recipe_params) { { name: name } }

    it "updates a recipe" do
      put :update, id: recipe.id, recipe: recipe_params
      recipe.reload
      expect(recipe.name).to eql(name)
    end
  end

  describe "DELETE destroy" do
    before(:each) { recipe }  # re-create the recipe so we can delete it

    it "destroys a recipe" do
      expect {
        delete :destroy, id: recipe.id
      }.to change(Recipe, :count).by(-1)
    end
  end

end
