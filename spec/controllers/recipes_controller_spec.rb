require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do

  let(:recipe) { create(:recipe_with_steps) }

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

    let(:new_recipe) { build(:recipe_with_steps) }
    let(:recipe_params) { new_recipe.attributes.symbolize_keys }
    let(:step_count) { new_recipe.steps.count }

    it "creates a recipe" do
      expect {
        post :create, recipe: recipe_params
      }.to change(Recipe, :count).by(1)
    end

    it "creates all steps for that recipe" do
      expect {
        post :create, recipe: recipe_params
      }.to change(Step, :count).by(step_count)
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

    let(:steps_count) { recipe.steps.count }

    before(:each) { recipe }  # re-create the recipe so we can delete it

    it "destroys a recipe" do
      expect {
        delete :destroy, id: recipe.id
      }.to change(Recipe, :count).by(-1)
    end

    it "destroys all steps for that recipe" do
      expect {
        delete :destroy, id: recipe.id
      }.to change(Step, :count).by(-steps_count)
    end
  end

end
