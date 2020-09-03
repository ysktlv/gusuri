require "rails_helper"

describe Goal do
  before do
    @goal = FactoryBot.build(:goal)
  end

  describe "ポイント項目登録" do
    context "ポイント項目が登録できるとき" do
      it "すべての項目が存在すれば登録できる" do
        expect(@goal).to be_valid
      end
    end
    context "ポイント項目が登録できないとき" do
      it "目標がないと登録できない" do
        @goal.name = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include("目標を入力してください")
      end
      it "ポイントがないと登録できない" do
        @goal.point = nil
        @goal.valid?
        expect(@goal.errors.full_messages).to include("ポイントは1~100の範囲で設定してください")
      end
      it "ポイントが1以上でないと登録できない" do
        @goal.point = 0
        @goal.valid?
        expect(@goal.errors.full_messages).to include("ポイントは1~100の範囲で設定してください")
      end
      it "ポイントが100以下でないと登録できない" do
        @goal.point = 101
        @goal.valid?
        expect(@goal.errors.full_messages).to include("ポイントは1~100の範囲で設定してください")
      end
    end
  end
end
