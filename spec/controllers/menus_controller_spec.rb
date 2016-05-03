require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'show action' do
    context 'when not authorized' do
      it 'redirect to user_session_path' do
        menu = FactoryGirl.create(:menu)
        get :show, { id: menu.id }, { :format => :json }
        expect(response).to redirect_to(user_session_path)
      end
    end

    context 'when authorized' do

      it 'renders show.json if an menu is found' do
        menu = FactoryGirl.create(:menu_with_dishes)
        puts(menu.dishes.name)
        expected_hash = {
          id: menu.id,
          name: menu.name,
          url: menu.url }.to_json
        get :show, { id: menu.id, user_email: menu.user.email, user_token: menu.user.authentication_token }, { :format => 'json' }
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_hash)
      end

    end
  end
end
