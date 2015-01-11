require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do

  let(:recipe) { build(:recipe) }

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, :id => recipe.id
      expect(response).to have_http_status(:success)
    end
  end
end
