class GroupsController < ApplicationController

  def new
  end

  def edit
   @group = Group.update(group_params)
   @user = User.find_by(name: params[:user_id])
   user_ids = []
   user_ids << @user.id
   user_ids << current_user.id
    user_ids.each do |id|
     @group.user_groups.update(group_id: @group.id, user_id: id)
    end
   redirect_to  "/"
  end

  def create
   @group = Group.create(group_params)
   @user = User.find_by(name: params[:user_id])
   user_ids = []
   user_ids << @user.id
   user_ids << current_user.id
    user_ids.each do |id|
     @group.user_groups.create(group_id: @group.id, user_id: id)
    end
   redirect_to  "/"
  end

  private

  def group_params
  params.permit(:name)
  end
end

