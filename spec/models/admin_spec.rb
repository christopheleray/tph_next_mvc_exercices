# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'admin instantiation' do
    subject(:new_admin) { described_class.new }

    let(:admin) { build(:admin) }

    describe 'database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
      it { is_expected.to have_db_column(:status).of_type(:boolean) }
      it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
      it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    end

    describe 'validation' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:password) }
    end
  end
end
