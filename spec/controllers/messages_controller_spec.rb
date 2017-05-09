require 'rails_helper'

describe MessagesController do
    describe '有効なパラメータの場合' do
      let(:user) { create(:user) }

      let(:params) do
        {
          group_id: 2,
          user_id: 1,
          message: {
          text: 'sample'
          }
        }
      end
      before do
        login_user user
      end

      it 'データベースに新しいユーザーが登録されること' do
        expect{
          post :create, params
        }.to change(Message, :count).by(1)
      end

      it 'indexにリダイレクトすること' do
        post :create, params
        expect(response).to redirect_to group_messages_path
      end
    end

    describe '無効なパラメータの場合' do
      let(:user) { create(:user) }

      let(:params) do
          {
            group_id: 2,
            user_id: 1,
            message: {
            text: ''
            }
          }
      end

      before do
        login_user user
      end

      it 'データベースに新しいユーザーが登録されないこと' do
        expect{
          post :create, params
        }.not_to change(Message, :count)
      end

      it 'indexにリダイレクトすること' do
        post :create, params
        expect(response).to redirect_to group_messages_path
      end

    end
end
