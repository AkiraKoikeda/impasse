# frozen_string_literal: true

require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:road) { create(:road, user: user) }
  let!(:other_road) { create(:road, user: other_user) }

  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
  end
end