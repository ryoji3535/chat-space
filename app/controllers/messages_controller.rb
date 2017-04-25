class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = @groups.first  if @groups.present?
  end
end
