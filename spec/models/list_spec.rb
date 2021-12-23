require 'rails_helper'

describe 'モデルのテスト' do
  it "userモデルに対して有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:list)).to be_valid
  end
end

