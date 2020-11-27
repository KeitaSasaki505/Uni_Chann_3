require 'rails_helper'
describe Comment do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.build(:event)
    binding.pry
    @event.images = fixture_file_upload('/files/test_image.png')
    @comment = FactoryBot.build(:comment, user_id: @user.id, event_id: @event.id)
  end

  describe 'コメント投稿機能' do
    context 'コメント可能' do
      it 'コメントが120文字以内であれば投稿できる' do
        @comment = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをん"
        expect(@comment).to be_valid
      end
    end

    context 'コメント不可' do
      it 'コメントが121文字以上であれば投稿できない' do
        @comment = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをんあいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやいゆえよらりるれろわいうえをん"
        @comment.valid?
        expect(@comment).to include()
      end
    end
  end
end