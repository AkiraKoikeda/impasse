# frozen_string_literal: true

require 'rails_helper'

describe 'トップ画面のテスト' do
  before do
    visit admin_root_path
  end
  context '表示の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/admin'
    end
    it ''
  end
end
