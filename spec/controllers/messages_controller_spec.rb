require 'rails_helper'

describe MessagesController do
  describe '有効なパラメータの場合' do
    let(:user) { create(:user) }

    let(:params) do
      {
        group_id: 2,
        message: {
        text: 'sample'
        }
      }
    end

    before do
      login_user user
    end

    it 'データベースに新しいメッセージが登録されること' do
      expect{
        post :create, params: params, user_id: user[:id]
      }.to change(Message, :count).by(1)
    end

    it 'indexにリダイレクトすること' do
      post :create, params: params
      expect(response).to redirect_to group_messages_path
    end
  end

  describe '無効なパラメータの場合' do
    let(:user) { create(:user) }

    let(:params) do
        {
          group_id: 2,
          message: {
          text: ''
          }
        }
    end

    before do
      login_user user
    end

    it 'データベースに新しいメッセージが登録されないこと' do
      expect{
        post :create, params: params, user_id: user[:id]
      }.not_to change(Message, :count)
    end

    it 'indexにリダイレクトすること' do
      post :create, params: params
      expect(response).to redirect_to group_messages_path
    end
  end
end
