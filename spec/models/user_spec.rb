# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'a valid user' do
    context 'when has valid params' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'when it does not have a first_name' do
      it 'is not valid' do
        user.first_name = nil
        expect(user).to_not be_valid
      end
    end

    context 'when it does not have a last_name' do
      it 'is not valid' do
        user.last_name = nil
        expect(user).to_not be_valid
      end
    end

    context 'email address' do
      let(:user1) { create(:user) }
      let(:user2) { create(:user) }

      it 'must exist' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'must be unique' do
        same_email = 'lorem@test.com'

        user1.update(email: same_email)
        user2.email = same_email
        expect(user2).to_not be_valid
      end

      it 'is not case_sensitive in uniqueness requirements' do
        same_email = 'lorem@test.com'

        user1.update(email: same_email)
        user2.email = same_email.upcase

        expect(user2).to_not be_valid
      end

      it 'must include an @ symbol' do
        user.email = 'useremail.com'
        expect(user).to_not be_valid
      end

      it 'must be at least 5 characters long (x@x.x)' do
        user.email = 'x@xx'
        expect(user).to_not be_valid
      end
    end

    context 'username' do
      let(:user1) { create(:user) }
      let(:user2) { create(:user) }

      it 'must exist' do
        user.username = nil
        expect(user).to_not be_valid
      end

      it 'must be unique' do
        same_username = 'lorem'

        user1.update(username: same_username)
        user2.username = same_username

        expect(user2).to_not be_valid
      end

      it 'is not case_sensitive in uniqueness requirements' do
        same_username = 'lorem'

        user1.update(username: same_username)
        user2.username = same_username.upcase

        expect(user2).to_not be_valid
      end
    end

    context 'password' do
      it 'must exist' do
        user.password = nil
        expect(user).to_not be_valid
      end

      it 'must have at least 5 characters' do
        pw = 'abc'
        user.password = pw
        user.password_confirmation = pw
        expect(user).to_not be_valid
      end

      it 'permits whitespace characters' do
        pw = 'a b c'
        user.password = pw
        user.password_confirmation = pw
        expect(user).to be_valid
      end
    end
  end

  describe '#format_username' do
    it 'converts usernames to downcase' do
      user.username = 'ABC'
      expect(user.format_username).to eq('abc')
    end
  end

  describe '#format_email' do
    it 'converts email to downcase' do
      user.email = 'ABC'
      expect(user.format_email).to eq('abc')
    end
  end

  describe '#to_param' do
    it 'returns the username as a param' do
      expect(user.to_param).to eq(user.username)
    end
  end
end
