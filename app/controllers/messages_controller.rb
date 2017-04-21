class MessagesController < ApplicationController
  def index
    @group = current_user.groups
    if @group.present?
      @groups = Group.find(@group[0][:id])
      @group_menber = @groups.users
      @group_menber_names = []
      num = 0
      while num < @group_menber.length
        @group_menber_names << @group_menber[num][:name]
        num = num + 1
      end
    end
  end
end
