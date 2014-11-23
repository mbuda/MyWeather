require 'rails_helper'

describe UsersController do
  let!(:user) { create(:user) }

  describe 'GET #new' do
    before do
      get :new
    end

    it 'assigns User to @user' do
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders :new template' do
      expect(response).to render_template(:new)
    end
  end
end
