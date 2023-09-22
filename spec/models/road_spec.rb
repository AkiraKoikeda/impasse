# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Road, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:road)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "addressが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '', car_model: 'プリウス', lat: 34.760023031284106, lng: 135.5138928854205, situation: 'とてもせまいです。', star: 3)
      expect(road).to be_invalid
    end
    it "car_modelが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '日本、〒564-0041 大阪府吹田市泉町２丁目３３', car_model: '', lat: 34.760023031284106, lng: 135.5138928854205, situation: 'とてもせまいです。', star: 3)
      expect(road).to be_invalid
    end
    it "latが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '日本、〒564-0041 大阪府吹田市泉町２丁目３３', car_model: 'プリウス', lat: 0, lng: 135.5138928854205, situation: 'とてもせまいです。', star: 3)
      expect(road).to be_invalid
    end
    it "lngが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '日本、〒564-0041 大阪府吹田市泉町２丁目３３', car_model: 'プリウス', lat: 34.760023031284106, lng: 0, situation: 'とてもせまいです。', star: 3)
      expect(road).to be_invalid
    end
    it "situationが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '日本、〒564-0041 大阪府吹田市泉町２丁目３３', car_model: 'プリウス', lat: 34.760023031284106, lng: 135.5138928854205, situation: '', star: 3)
      expect(road).to be_invalid
    end
    it "starが空白の場合のバリデーションチェック" do
      road = Road.new(user_id: 2, address: '日本、〒564-0041 大阪府吹田市泉町２丁目３３', car_model: 'プリウス', lat: 34.760023031284106, lng: 135.5138928854205, situation: 'とてもせまいです。', star: 0)
      expect(road).to be_invalid
    end
  end
end