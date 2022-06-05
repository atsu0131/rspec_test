require 'rails_helper'

RSpec.describe "FoodEnquetes", type: :request do
  describe '正常' do
    context "アンケートに回答する" do
      it "回答できること" do
        # [Point.3-15-1]アンケートページにアクセスします。
        get "/food_enquetes/new"
        # [Point.3-15-2]正常に応答することを確認します。
        expect(response).to have_http_status(200)

        # [Point.3-15-3]正常な入力値を送信します。
        post "/food_enquetes", params: { food_enquete: FactoryBot.attributes_for(:food_enquete_tanaka) }
        # [Point.3-15-4]リダイレクト先に移動します。
        follow_redirect!
        # [Point.3-15-5]送信完了のメッセージが含まれることを検証します。
        expect(response.body).to include "お食事に関するアンケートを送信しました"
      end
    end
  end
end
