class MessagesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @group = @user.groups
    if @group.present?
      @ug = Group.find(@group[0][:id])
      @ugo = @ug.users
      @ugoo = []
      num = 0
      while num < @ugo.length
        @ugoo << @ugo[num][:name]
        num = num + 1
      end
    end
      #@all_groups = Group.find(current_user.id).order("desc")
  end
end
