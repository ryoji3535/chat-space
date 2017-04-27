class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = @groups.first
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to "/groups/#{@group.id}/messages"
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
