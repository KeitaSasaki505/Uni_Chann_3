require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      # it 'nickname、email、password、password_confirmation、name_kanji, name_kanaがあれば登録できる' do
      #   expect(@user).to be_valid
      # end

      it 'passwordが8文字以上であれば登録できる' do
        @user.password = 'abcdef12'
        @user.password_confirmation = 'abcdef12'
        expect(@user).to be_valid
      end

    #   it 'passwordが英数混合であれば登録できる' do
    #     @user.password = 'abcd12'
    #     @user.password_confirmation = 'abcd12'
    #     expect(@user).to be_valid
    #   end

    #   it 'emailに@が含まれるため登録できる' do
    #     @user.email = 'abc@gmail.com'
    #     expect(@user).to be_valid
    #   end

    #   it 'family_name,first_name,family_name_kana,first_name_kanaが全角だと登録できる' do
    #     @user.family_name = 'あいうえお'
    #     @user.first_name = 'かきくけこ'
    #     expect(@user).to be_valid
    #   end

    #   it 'family_name_kana,first_name_kanaがカナであれば登録できる' do
    #     @user.family_name_kana = 'アイウエオ'
    #     @user.first_name_kana = 'カキクケコ'
    #     expect(@user).to be_valid
    #   end
    # end

    # context '新規登録がうまくいかない時' do
    #   it 'nicknameが存在しなければ登録できない' do
    #     @user.nickname = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Nickname can't be blank")
    #   end

    #   it 'emailが空であれば登録できない' do
    #     @user.email = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Email can't be blank")
    #   end

    #   it 'emailがすでにDBに保存されているものであれば登録できない' do
    #     @user.save
    #     another_user = FactoryBot.build(:user, email: @user.email)
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include('Email has already been taken')
    #   end

    #   it 'emailに@が含まれない場合登録できない' do
    #     @user.email = 'abcdef'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Email is invalid')
    #   end

    #   it 'passwordが空であれば登録できない' do
    #     @user.password = ''
    #     @user.password_confirmation = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Password can't be blank")
    #   end

    #   it 'passwordが5文字以下であれば登録できない' do
    #     @user.password = '00000'
    #     @user.password_confirmation = '00000'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    #   end

    #   it 'passwordが英数どちらかの文字種のみだと登録できない' do
    #     @user.password = 'abcdef'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    #   end

    #   it 'family_nameが空であれば登録できない' do
    #     @user.family_name = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Family name can't be blank")
    #   end

    #   it 'first_nameが空であれば登録できない' do
    #     @user.first_name = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name can't be blank")
    #   end

    #   it 'family_name_kanaが空であれば登録できない' do
    #     @user.family_name_kana = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    #   end

    #   it 'first_name_kanaが空であれば登録できない' do
    #     @user.first_name_kana = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("First name kana can't be blank")
    #   end

    #   it 'family_nameが半角だと登録できない' do
    #     @user.family_name = 'xyz'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Family name Full-width characters')
    #   end

    #   it 'first_nameが半角だと登録できない' do
    #     @user.first_name = 'def'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name Full-width characters')
    #   end

    #   it 'family_name_kanaが半角カナであれば登録できない' do
    #     @user.family_name_kana = 'ｱｲｳ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters')
    #   end

    #   it 'first_name_kanaが半角カナであれば登録できない' do
    #     @user.first_name_kana = 'ｴｵｶ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    #   end

    #   it 'birthdayが空であれば登録できない' do
    #     @user.birthday = nil
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Birthday can't be blank")
    #   end
    end
  end
end