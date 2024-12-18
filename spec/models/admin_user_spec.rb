require "rails_helper"

RSpec.describe AdminUser, type: :model do
  describe "schema" do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(default: "", null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:reset_password_token) }
  end
end
