require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント作成画面" do
    context 'コメントの作成ができるとき' do
      it "commentが存在すれば登録できる" do
        expect(@comment).to be_valid
      end
    end

    context 'コメントの作成ができないとき' do
      it "commentが空では登録できない" do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end

      it "commentが200文字以上では登録できない" do
        @comment.comment = Faker::Lorem.characters(number: 201)
        @comment.valid?
        binding.pry
        expect(@comment.errors.full_messages).to include("Comment is too long (maximum is 200 characters)")
      end
    end
  end
end

