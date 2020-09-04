require "rails_helper"

describe Reflection do
  before do
    @reflection = FactoryBot.build(:reflection)
  end

  describe "日記登録" do
    context "日記が登録できるとき" do
      it "すべての項目が存在すれば登録できる" do
        expect(@reflection).to be_valid
      end
    end
    context "日記が登録できないとき" do
      it "日付がないと登録できない" do
        @reflection.start_time = nil
        @reflection.valid?
        expect(@reflection.errors.full_messages).to include("日付は今日以前を選択してください")
      end
      it "ひとことがないと登録できない" do
        @reflection.impression = nil
        @reflection.valid?
        expect(@reflection.errors.full_messages).to include("ひとことを入力してください")
      end
      it "明日以降の日付だと登録できない" do
        @reflection.start_time = Date.tomorrow
        @reflection.valid?
        expect(@reflection.errors.full_messages).to include("日付は今日以前を選択してください")
      end
    end
  end
end
