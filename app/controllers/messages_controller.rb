class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = @groups.first
  end
end
