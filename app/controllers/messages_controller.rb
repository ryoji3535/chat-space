class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id]).order("id DESC")
  end

  def create
    message = Message.new(text: message_params[:text],image: message_params[:image], user_id: current_user.id, group_id: params[:group_id])
    if message.save
      redirect_to  group_messages_path, notice: "メッセージ送信成功"
    else
      redirect_to  group_messages_path, alert: "メッセージ送信失敗"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text , :image)
  end

end
