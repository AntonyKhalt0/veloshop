# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:products) { create_list(:product, 3, category: category) }

    before { get :index }

    it 'render index view' do
      expect(response).to render_template :index
    end

    it 'render products array' do
      expect(assigns(:products)).to match_array(products)
    end
  end

  describe 'GET #show' do
    let(:product) { create(:product, category: category) }

    before { get :show, params: { id: product } }

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
      it 'save a new product in the database' do
        expect do
          post :create,
               params: { product: attributes_for(:product), category_id: category.id }
        end.to change(Product, :count).by(1)
      end

      it 'render show view' do
        post :create, params: { product: attributes_for(:product), category_id: category.id }
        expect(response).to render_template :show
      end
    end

    context 'with invalid attributes' do
      it 'save a new product in the database' do
        expect do
          post :create,
               params: { product: attributes_for(:product, :invalid), category_id: category.id }
        end.to_not change(Product, :count)
      end

      it 'render new view' do
        post :create, params: { product: attributes_for(:product, :invalid), category_id: category.id }

        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    let(:product) { create(:product, category: category) }

    before { get :edit, params: { id: product } }

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let!(:product) { create(:product, category: category) }

    context 'with valid attributes' do
      it 'save a change product in the database' do
        patch :update, params: { id: product.id, product: { title: 'Test title' }, category_id: category.id }
        product.reload

        expect(product.title).to eq 'Test title'
      end

      it 'redirect to show view' do
        patch :update, params: { id: product.id, product: { title: 'Test title' }, category_id: category.id }
        product.reload

        expect(response).to redirect_to product
      end
    end

    context 'with invalid attributes' do
      it 'save a new product in the database' do
        expect do
          patch :update,
                params: { id: product.id, product: { title: nil }, category_id: category.id }
        end.to_not change(Product, :count)
      end

      it 'render edit view' do
        patch :update, params: { id: product.id, product: { title: nil }, category_id: category.id }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product, category: category) }

    it 'succesfully destroy product' do
      expect { delete :destroy, params: { id: product.id } }.to change(Product, :count).by(-1)
    end
  end
end
