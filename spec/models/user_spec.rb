require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload( '/files/test-image3.png' )
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'nickname、email、password、password_confirmation、name_kanji, name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'nicknameがあれば登録できる' do
        @user.nickname = 'サンプルネーム'
        expect(@user).to be_valid
      end

      it 'passwordが8文字以上であれば登録できる' do
        @user.password = 'abcdef12'
        @user.password_confirmation = 'abcdef12'
        expect(@user).to be_valid
      end

      it 'passwordが英数混合であれば登録できる' do
        @user.password = 'abcdef12'
        @user.password_confirmation = 'abcdef12'
        expect(@user).to be_valid
      end

      it 'emailに@が含まれれば登録できる' do
        @user.email = 'test@example.com'
        expect(@user).to be_valid
      end

      it 'name_kanjiが全角だと登録できる' do
        @user.name_kanji = '久保建英'
        expect(@user).to be_valid
      end

      it 'name_kanaが全角カナであれば登録できる' do
        @user.name_kana = 'クボタケフサ'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが存在しなければ登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空であれば登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailがすでにDBに保存されているものであれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれない場合登録できない' do
        @user.email = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空であれば登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが7文字以下であれば登録できない' do
        @user.password = 'abcd123'
        @user.password_confirmation = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
      end

      it 'passwordが英数どちらかの文字種のみだと登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は文字と数字を含めたパスワードにしてください")
      end

      it 'name_kanjiが空であれば登録できない' do
        @user.name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji を全角で入力してください")
      end

      it 'name_kanaが空であれば登録できない' do
        @user.name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana を全角カタカナで入力してください")
      end

      it 'name_kanjiが半角だと登録できない' do
        @user.name_kanji = 'xyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kanji を全角で入力してください')
      end

      it 'name_kanaが半角だと登録できない' do
        @user.name_kana = 'def'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana を全角カタカナで入力してください')
      end

    end
  end
end
