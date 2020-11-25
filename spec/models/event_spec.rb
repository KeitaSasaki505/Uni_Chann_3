require 'rails_helper'
describe Event do
  before do
    @event = FactoryBot.build(:event)
    @event.images = fixture_file_upload('/files/test_image.png')
  end

  describe 'イベント投稿' do
    context 'イベント投稿可能' do
      it 'images, overview, project, address, email, date, phone, genre_idが存在すればイベント投稿できる' do
        expect(@event).to be_valid
      end
    end

    context 'イベント投稿不可能' do
      it 'イベント画像が一枚もない場合は投稿できない' do
        @event.images = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Images can't be blank")
      end

      it 'イベント概要が空では登録できない' do
        @event.overview = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Overview can't be blank")
      end

      it 'イベント概要が400文字以上の場合は登録できない' do
        @event.overview = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをん"
        @event.valid?
        expect(@event.errors.full_messages).to include("Overview は400文字以内です")
      end

      it 'イベント名が空では登録できない' do
        @event.project = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Project can't be blank")
      end

      it 'イベント名が50文字以上の場合は登録できない' do
        @event.project = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをん"
        @event.valid?
        expect(@event.errors.full_messages).to include("Project は50文字以内です")
      end

      it '開催場所が空では登録できない' do
        @event.address = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Address can't be blank")
      end

      it 'emailが空では登録できない' do
        @event.email = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが@を含まない場合は登録できない' do
        @event.email = "abcdef.com"
        @event.valid?
        expect(@event.errors.full_messages).to include("Email is invalid")
      end

      it '日付が空では登録できない' do
        @event.date = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Date can't be blank")
      end

      it '電話番号が空では登録できない' do
        @event.phone = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号が9桁以内の場合登録できない' do
        @event.phone = "090123456"
        @event.valid?
        expect(@event.errors.full_messages).to include("Phone is invalid")
      end

      it 'カテゴリの「---」を選択した場合は登録できない' do
        @event.genre_id = 0
        @event.valid?
        expect(@event.errors.full_messages).to include("Genre が選択されていません")
      end
    end
  end
end
