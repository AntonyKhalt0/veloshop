# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:seller) { create(:user, :seller) }

  before { login(seller) }

  describe 'GET #index' do
    let(:categories) { create_list(:category, 3) }

    before { get :index }

    it 'render products array' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:category) { create(:category) }

    before { get :show, params: { id: category } }

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save a new category in the database' do
        expect do
          post :create,
               params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'render show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to render_template :show
      end
    end

    context 'with invalid attributes' do
      it 'save a new category in the database' do
        expect do
          post :create,
               params: { category: attributes_for(:category, :invalid_category) }
        end.to_not change(Category, :count)
      end

      it 'render new view' do
        post :create, params: { category: attributes_for(:category, :invalid_category)}

        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    let(:category) { create(:category) }

    before { get :edit, params: { id: category } }

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let!(:category) { create(:category) }

    context 'with valid attributes' do
      it 'save a change category in the database' do
        patch :update, params: { id: category.id, category: { title: 'Test title' } }
        category.reload

        expect(category.title).to eq 'Test title'
      end

      it 'redirect to show view' do
        patch :update, params: { id: category.id, category: { title: 'Test title' } }
        category.reload

        expect(response).to redirect_to category
      end
    end

    context 'with invalid attributes' do
      it 'save a new category in the database' do
        expect do
          patch :update,
                params: { id: category.id, category: { title: nil } }
        end.to_not change(Category, :count)
      end

      it 'render edit view' do
        patch :update, params: { id: category.id, category: { title: nil } }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:category) { create(:category) }

    it 'succesfully destroy product' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end
  end
end
