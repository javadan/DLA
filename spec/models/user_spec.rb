require 'spec_helper'

describe User do
  describe '.authenticate' do
    let(:authenticate) { User.authenticate(auth_hash) }

    context 'when auth hash is valid' do
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
    
      context 'when user exists' do
        let!(:user) { FactoryGirl.create(:user, fb_uid: auth_hash['uid']) }

        it 'does not create a new user' do
          expect { authenticate }.to_not change(User, :count)
        end

        it 'returns the existing user' do
          expect(authenticate).to eq(user)
        end
      end

      context 'when user does not exist' do
        it 'creates a new user' do
          expect { authenticate }.to change(User, :count).by(1)
        end

        it 'maps attributes correctly' do
          user = authenticate
          expect(user.first_name).to eq('Dan')
          expect(user.last_name).to eq('Davey')
          expect(user.email).to eq('dan@recombinary.com')
          expect(user.fb_uid).to eq('100007074455662')
          expect(user.fb_username).to eq('dan.davey.146')
          expect(user.fb_token).to eq('CAAICWubbWsQBAHsj3t')
        end
      end
    end

    context 'when auth hash is invalid' do
      let(:auth_hash) do
        {}
      end

      it 'does not create a new user' do
        expect { authenticate }.to_not change(User, :count)
      end

      it 'returns nil' do
        expect(authenticate).to be_nil
      end
    end
  end

end
