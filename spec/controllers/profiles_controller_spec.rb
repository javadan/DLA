require 'spec_helper'

describe ProfilesController do
  describe '#update' do
    context 'when successfully updating for the first time' do
      let(:user) { FactoryGirl.create(:user, profile_updated: false) }
      before { controller.auto_login(user) }
      it 'sets #profile_updated to true' do
        put :update, user: { email: "new-#{user.email}" }
        user.reload
        expect(response).to redirect_to :dashboard
        expect(user).to be_profile_updated
      end
    end
  end
end
