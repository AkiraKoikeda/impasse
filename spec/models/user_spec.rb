# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "バリデーションのテスト" do
    subject { user.valid? }
      let!(:other_user) { create(:user) }
      let(:user) { build(:user) }
    context "nameカラム" do
      it "空白でないこと" do
        user.name = ''
        is_expected.to eq false
      end
      it "2文字以上であること" do
        user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false
      end
      it "10文字以下であること" do
        user.name = Faker::Lorem.characters(number:11)
        is_expected.to eq false
      end
      it "一意性があること" do
        user.name = other_user.name
        is_expected.to eq false
      end
    end
    context "emailカラム" do
      it "空白でない" do
        user.email = ''
        is_expected.to eq false
      end
      it "一意性があること" do
        user.email = other_user.email
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Roadモデルとの関係' do
      it "1:Nとなっている" do
        expect(User.reflect_on_association(:roads).macro).to eq :has_many
      end
    end
  end
end