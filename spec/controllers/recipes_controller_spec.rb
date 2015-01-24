require 'pry'
require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do

  render_views

  let(:recipe) { create(:recipe) }

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
      expect(assigns(:recipe)).to be_a_new(Recipe)
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
    it "creates a recipe" do
      expect {
        post :create, recipe: FactoryGirl.attributes_for(:recipe)
      }.to change(Recipe, :count).by(1)
    end
  end
end
