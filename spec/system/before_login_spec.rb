# frozen_string_literal: true

require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    # context 'googlemapsAPIの動作確認', js: true do
    #   it 'ピンをクリックすると詳細が表示される' do

    #   end
    # end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'トップ画面に詳細画面へのリンクが存在するか' do
        expect(page).to have_link "", href: road_path(road)
        # show_link = find_all('a')[j]
        # expect(show_link.native.inner_text).to match(/show/i)
        # expect(show_link[:href]).to eq road_path(road)
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

  describe 'ヘッダーのテスト: ログインしていない場合 ' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'impasseリンクが表示される:左上から1番目のリンクがロゴである' do
        home_link = find_all('a')[0].text
        expect(home_link).to match ('impasse.png')
      end
    end
  end
end