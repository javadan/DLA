require 'spec_helper'

describe AuthenticatedController do
  controller do
    def index
      render nothing: true
    end
  end

  context 'when current_user is set' do
    let(:user) { FactoryGirl.build(:user) }
    before { controller.auto_login(user) }
    it 'allows the request' do
      get :index
      expect(response).to be_success
    end
  end

  context 'when current_user is not set' do
    before { controller.logout }
    it 'redirects to login page' do
      get :index
      expect(response).to redirect_to(:login)
    end
  end
end
