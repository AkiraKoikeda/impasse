# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーションのテスト" do
    subject { user.valid? }
      let!(:other_user) { create(:user) }
      let(:user) { build(:user) }
    context "空白のバリデーションチェック" do
      it "nameが空白の場合のバリデーションチェック" do
        user.name = ''
        is_expected.to eq false
      end
      it "emailが空白の場合のバリデーションチェック" do
        user.email = ''
        is_expected.to eq false
      end
    end
  end
end