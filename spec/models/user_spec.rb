require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての入力ができているとき' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'tec.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcabcabc'
        @user.password_confirmation = 'abcabcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Abcabcabc'
        @user.password_confirmation = 'Abcabcabc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名前が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it '名前が英数字だと登録できない' do
        @user.name = 'shimizu44'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it 'チーム名が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it '背番号が空だと登録できない' do
        @user.number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Number can't be blank")
      end
      it '背番号が半角英数字以外だと登録できない' do
        @user.number = '４４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Number is invalid")
      end
    end
  end
end