require 'rails_helper'

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'トップ画面に詳細画面へのリンクが存在するか' do
        expect(page).to have_link "", href: road_path
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/homes/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/homes/about'
      end
    end
  end