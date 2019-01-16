# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user instantiation' do
    subject(:new_user) { described_class.new }

    let(:user) { build(:user) }

    describe 'database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
      it { is_expected.to have_db_column(:first_name).of_type(:string) }
      it { is_expected.to have_db_column(:last_name).of_type(:string) }
      it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
      it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
      it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end

    describe 'unit test validation' do
      it 'is valid with valid attibutes' do
        expect(user).to be_valid
      end
      it 'is not valiated without attibutes' do
        expect(subject).not_to be_valid
      end
    end
  end
end
