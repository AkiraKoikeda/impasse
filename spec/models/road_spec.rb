# frozen_string_literal: true

require "rails_helper"

RSpec.describe Road, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { road.valid? }

    let(:user) { create(:user) }
    let!(:road) { build(:road, user_id: user.id) }

    context "addressカラム" do
      it "空白の場合のバリデーションチェック" do
        road.address = ''
        is_expected.to eq false
      end
    end
    context "car_modelカラム" do
      it "空白でないこと" do
        road.car_model = ''
        is_expected.to eq false
      end
      it "2文字以上であること" do
        road.car_model = Faker::Vehicle.car_type(number: 1)
        is_expected.to eq false
      end
      it "20文字以以下であること" do
        road.car_model = Faker::Vehicle.car_type(number: 21)
        is_expected.to eq false
      end
    end
    context "latカラム" do
      it "空白でないこと" do
        road.lat = ()
        is_expected.to eq false
      end
    end
    context "lngカラム" do
      it "空白でないこと" do
        road.lng = ()
        is_expected.to eq false
      end
    end
    context "situationカラム" do
      it "空白でないこと" do
        road.situation = ''
        is_expected.to eq false
      end
    end
    context "starカラム" do
      it "空白でないこと" do
        road.star = ()
        is_expected.to eq false
      end
    end
  end
end