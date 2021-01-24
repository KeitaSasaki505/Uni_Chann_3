require 'rails_helper'
describe Join do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.build(:event)
    @event.images = fixture_file_upload('/files/test_image.png')
    # ※イベントイメージの投稿テストについて調査
    @join = FactoryBot.build(:join, user_id: @user.id, event_id: @event.id)
  end

  describe 'イベント参加機能' do
    context 'イベント参加可能' do
      it 'メール、電話番号、名前（全角）、名前（全角カナ）が存在すればイベントに参加できる' do
        expect(@join).to be_valid
      end
    end

    context 'イベント参加不可能' do
      it 'emailが空では参加できない' do
        @join.email = nil
        @join.valid?
        expect(@join.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まなければ登録できない' do
        @join.email = "abcdefeg.com"
        @join.valid?
        expect(@join.errors.full_messages).to include("Email is invalid")
      end

      it '電話番号が空では参加できない' do
        @join.phone = nil
        @join.valid?
        expect(@join.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が9桁以内の場合は参加登録できない' do
        @join.phone = "090123123"
        @join.valid?
        expect(@join.errors.full_messages).to include("Phone is invalid")
      end

      it 'name_kanjiが空では参加登録できない' do
        @join.name_kanji = nil
        @join.valid?
        expect(@join.errors.full_messages).to include("Name kanji can't be blank")
      end

      it 'name_kanjiが半角では参加登録できない' do
        @join.name_kanji = "xyz"
        @join.valid?
        expect(@join.errors.full_messages).to include("Name kanji は全角で入力してください")
      end

      it 'name_kanaが空では参加登録できない' do
        @join.name_kana = nil
        @join.valid?
        expect(@join.errors.full_messages).to include("Name kana can't be blank")
      end

      it 'name_kanaが半角では参加登録できない' do
        @join.name_kana = "ｱｲｳｴｵ"
        @join.valid?
        expect(@join.errors.full_messages).to include("Name kana は全角カナで入力してください")
      end

      it 'messageが401文字以上の場合は登録できない' do
        @join.message = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをん"
        @join.valid?
        expect(@join.errors.full_messages).to include("Message は400文字以内です")
      end
    end
  end
end