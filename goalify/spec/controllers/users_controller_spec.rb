require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:user) { User.create!(username: 'ala', password: 'password123')}

    describe 'get#index' do
        it 'renders all users on index view' do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe 'get#show' do
        it 'renders show template' do
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end
    end

    describe 'get#new' do
        it 'renders new template' do
            get :new
            expect(response).to render_template(:new)
        end
    end

end