require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe "記事作成画面" do
    context '記事の作成ができるとき' do
      it "title,contentが存在すれば登録できる" do
        expect(@article).to be_valid
      end
    end

    context '記事の作成ができないとき' do
      it "titleが空では登録できない" do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it "titleが50文字以上では登録できない" do
        @article.title = Faker::Lorem.characters(number: 51)
        @article.valid?
        expect(@article.errors.full_messages).to include("Title is too long (maximum is 50 characters)")
      end

      it "contentが空では登録できない" do
        @article.content = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
