class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id]).order("id DESC")
  end

  def create
    Message.create(text: message_params[:text],image: message_params[:image], user_id: current_user.id, group_id: params[:group_id])
    redirect_to  group_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:text , :image)
  end

end
