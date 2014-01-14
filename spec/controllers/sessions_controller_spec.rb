require 'spec_helper'

describe SessionsController do
  describe '#new' do
    context 'when not logged in' do
      it 'renders a login page' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context 'when logged in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        controller.auto_login(user)
      end
      it 'redirects to dashboard' do        
        get :new
        expect(response).to redirect_to(:dashboard)
      end
    end
  end

  describe '#create' do
    let(:user) { FactoryGirl.create(:user) }
    let(:create) { post :create }
 
    context 'when authenticate is successful' do
      let(:auth_hash) do
        {
          'uid' => '100007074455662',
          'info' => {
            'first_name' => 'Dan',
            'last_name' => 'Davey',
            'email' => 'dan@recombinary.com',
          },
          'credentials' => {
            'token' => 'CAAICWubbWsQBAHsj3t',
          },
          'extra' => {
            'raw_info' => {
              'username' => 'dan.davey.146'
            }
          }
        }
      end
      before do
        controller.env['omniauth.auth'] = auth_hash
        expect(User).to receive(:authenticate).once.with(auth_hash).and_return(user)
      end

      it 'logs the user in' do
        expect { create }.to change { controller.current_user }.from(nil).to(user)
      end

      it 'redirects with a success flash' do
        create
        expect(response).to redirect_to(:dashboard)
        expect(flash[:success]).to be_present
      end
    end

    context 'when authenticate fails' do
      before do
        expect(User).to receive(:authenticate).once.and_return(nil)
      end

      it 'does not log the user in' do
        create
        expect(controller.current_user).to be_falsy
      end

      it 'redirects with an error flash' do
        create
        expect(response).to redirect_to(:login)
        expect(flash[:error]).to be_present
      end
    end
  end

  describe '#destroy' do
    let(:user) { FactoryGirl.create(:user) }
    let(:destroy) { delete :destroy }
    before { controller.auto_login(user) }
    it 'logs the user out' do
      expect { destroy }.to change{ controller.current_user }.from(user).to(nil)
    end
    it 'redirects with a success flash' do
      destroy
      expect(response).to redirect_to(:login)
      expect(flash[:success]).to be_present
    end
  end
end
