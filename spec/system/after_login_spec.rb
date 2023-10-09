# frozen_string_literal: true

require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:road) { create(:road, user: user) }
  let!(:other_road) { create(:road, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト' do
    before do
      visit '/roads'
    end
    context '表示内容の確認' do
      it 'impasseリンクが表示される:左上から1番目のリンクがロゴである' do
        home_link = find_all('a')[0].image
        expect(home_link).to match ('impasse.png')
      end

      it '地点登録リンクが表示される：左上から2番目になり、地点登録へのリンクになっている'do
        new_post_link = find_all('a')[1].text
        expect(new_post_link).to match ('地点登録')
        click_link '地点登録'
        expect(current_path).to eq new_road_path
      end

      it 'Aboutリンクが表示される：左上から3番目になり、About画面へのリンクになっている' do
        about_link = find_all('a')[2].text
        expect(about_link).to match("About")
        click_link 'About'
        expect(current_path).to eq '/homes/about'
      end

      it 'マイページリンクが表示される：左上から4番目になり、マイページ画面へのリンクになっている' do
        mypage_link = find_all('a')[3].text
        expect(mypage_link).to match("マイページ")
        click_link 'マイページ'
        expect(current_path).to eq '/users'
      end

      it 'ログアウトリンクが表示される：左上から5番目になり、ログアウト処理のリンクになっている' do
      log_out_link = find_all('a')[4].text
      expect(log_out_link).to match("ログアウト")
    end
   end
  end

  describe '地点登録画面のテスト' do
    before do
      visit new_road_path
    end
    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq new_road_path
      end
      it '住所の入力フォームがある' do
        expect(page).to have_field 'road[address]'
      end
      it '緯度の入力フォームがある' do
        expect(page).to have_field 'road[lat]'
      end
      it '経度の入力フォームがある' do
        expect(page).to have_field 'road[lng]'
      end
      # it '走行難度の入力フォームがある' do
      #   expect(page).to have_field 'road[star]'
      # end
      it '車種の入力フォームがある' do
        expect(page).to have_field 'road[car_model]'
      end
      it '詳細説明の入力フォームがある' do
        expect(page).to have_field 'road[situation]'
      end
      it '投稿ボタンがある' do
        expect(page).to have_button '投稿'
      end
    end
  end

  describe '投稿詳細画面のテスト' do
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
  describe '投稿編集画面のテスト' do
    before do
    #   second_user_road = FactoryBot.create(:road, user: user)
    #   visit road_path(second_user_road)
    #   click_link '編集'
    #   expect(current_path).to eq edit_road_path(second_road_path)
    visit edit_road_path(road)
    end
    context '表示内容のテスト' do
      it 'URLが正しい' do
        expect(current_path).to eq '/roads/' + road.id.to_s + '/edit'
      end
      it '住所の入力フォームがある' do
        expect(page).to have_field 'road[address]', with: road.address
      end
      it '緯度の入力フォームがある' do
        expect(page).to have_field 'road[lat]', with: road.lat
      end
      it '経度の入力フォームがある' do
        expect(page).to have_field 'road[lng]', with: road.lng
      end
      # it '走行難度の入力フォームがある' do
      #   expect(page).to have_field 'road[star]', with: road.star
      # end
      it '車種の入力フォームがある' do
        expect(page).to have_field 'road[car_model]', with: road.car_model
      end
      it '詳細説明の入力フォームがある' do
        expect(page).to have_field 'road[situation]', with: road.situation
      end
      it '更新ボタンがある' do
        expect(page).to have_button '更新'
      end
    end
  end
end