class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(@groups.first.id)
  end
end
