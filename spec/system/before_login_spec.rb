# frozen_string_literal: true

require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:road) { create(:road, user: user) }
  let!(:other_road) { create(:road, user: other_user) }

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
        home_link = find_all('a')[0].image
        expect(home_link).to match ('impasse.png')
      end

      it '地点登録リンクが表示される：左上から2番目になり、ログイン画面へのリンクになっている' do
        new_post_link = find_all('a')[1].text
        expect(new_post_link).to match("地点登録")
      end

      it 'Aboutリンクが表示される：左上から3番目になり、About画面へのリンクになっている' do
        about_link = find_all('a')[2].text
        expect(about_link).to match("About")
      end

      it '新規会員登録リンクが表示される：左上から4番目になり、新規会員登録画面へのリンクになっている' do
        registar_link = find_all('a')[3].text
        expect(registar_link).to match("新規会員登録")
      end

      it 'ログインリンクが表示される：左上から5番目になり、ログイン画面へのリンクになっている' do
        log_in_link = find_all('a')[4].text
        expect(log_in_link).to match("ログイン")
      end
    end
  end
  describe '投稿詳細画面の確認' do
    before do
      visit road_path(road)
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/roads/' + road.id.to_s
      end
      it '住所、緯度、経度、走行難度、車種、詳細説明が表示されている' do
        expect(page).to have_content road.address
        expect(page).to have_content road.lat
        expect(page).to have_content road.lng
        expect(page).to have_content road.star
        expect(page).to have_content road.car_model
        expect(page).to have_content road.situation
      end
      it 'コメントが表示されている' do
        expect(page).to have_content road_comment.comment
      end
    end
  end
end