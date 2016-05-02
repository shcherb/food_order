require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'show action' do
    it 'renders show.json if an menu is found' do
      menu = FactoryGirl.create(:menu)
      get :show, { id: menu.id }

    end
  end
end
