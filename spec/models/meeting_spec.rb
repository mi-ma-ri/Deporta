require 'rails_helper'

RSpec.describe Meeting, type: :model do
  before do
    @meeting = FactoryBot.create(:meeting)
  end
  
  describe 'ミーティング事項' do
    context '共有事項が登録がうまくいくとき' do
      it '全ての入力ができているとき' do
        expect(@meeting).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '共有事項が空だと登録できない' do
        @meeting.content = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("Content can't be blank")
      end
      it '攻撃面についての共有事項が空だと登録できない' do
        @meeting.attack = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("Attack can't be blank")
      end
      it '攻撃面についての共有事項が空だと登録できない' do
        @meeting.defence = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("Defence can't be blank")
      end
      it '攻撃動画についての共有事項が空だと登録できない' do
        @meeting.attack_url = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("Attack url can't be blank")
      end
      it '攻撃動画についての共有事項が空だと登録できない' do
        @meeting.defence_url = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("Defence url can't be blank")
      end
    end
  end
end