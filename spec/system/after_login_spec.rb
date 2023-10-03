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

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
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

      it '地点登録リンクが表示される：左上から2番目になり、新規投稿画面へのリンクになっている'do
        new_post_link = find_all('a')[1].text
        expect(new_post_link).to match ('地点登録')
      end

      it 'Aboutリンクが表示される：左上から3番目になり、About画面へのリンクになっている' do
        about_link = find_all('a')[2].text
        expect(about_link).to match("About")
      end

      it 'マイページリンクが表示される：左上から4番目になり、マイページ画面へのリンクになっている' do
        mypage_link = find_all('a')[3].text
        expect(mypage_link).to match("マイページ")
      end

      it 'ログアウトリンクが表示される：左上から5番目になり、ログアウト処理のリンクになっている' do
      log_out_link = find_all('a')[4].text
      expect(log_out_link).to match("ログアウト")
    end
   end
  end
end