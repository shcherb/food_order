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
    #  before do
#   #     it 'user should authorized' do
    #      #user = FactoryGirl.create(:user)
    #      menu = FactoryGirl.create(:menu)
    #      get "/api/v1/sign_in", {user: menu.user.email, password: menu.user.password}, { :format => :json }
    #      expect(response.status).to eq(200)
#   #     end
    #  end

      it 'renders show.json if an menu is found' do
        menu = FactoryGirl.create(:menu_with_dishes)
        #dish = FactoryGirl.create(:dish)
        @expected = {
          id: menu.id,
          name: menu.name,
          url: menu.url }.to_json
        #get "/api/v1/sign_in", {user: menu.user.email, password: menu.user.password}, { :format => :json }
        get :show, { id: menu.id, user_email: menu.user.email, user_token: menu.user.authentication_token }, { :format => :json }
        #expect(response).to redirect_to(user_session_path)
        expect(response.body).to eq(@expected)
      end

    end
  end
end
