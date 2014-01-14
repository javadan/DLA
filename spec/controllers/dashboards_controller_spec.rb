require 'spec_helper'

describe DashboardsController do
  describe '#check_profile_updated' do
    context 'when #profile_updated is true' do
      let(:user) { FactoryGirl.create(:user, profile_updated: true) }
      before { controller.auto_login(user) }
      it 'renders the dashboard' do
        get :show
        expect(response).to render_template(:show)
      end
    end

    context 'when #profile_updated is false' do
      let(:user) { FactoryGirl.create(:user, profile_updated: false) }
      before { controller.auto_login(user) }
      it 'redirects to profile edit page' do
        get :show
        expect(response).to redirect_to([:edit, :profile])
      end
    end
  end
end
