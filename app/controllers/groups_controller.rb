class GroupsController < ApplicationController

  def new
  end

  def edit
    @edit_group = Group.find(params[:id])
  end

  def update
   @group = params[:group_name].join
   @user = User.find_by(name: params[:user_name])
   if Group.find_by(name: @group).present?
     if @user.present?
       @user.user_groups.update(user_id: @user[:id])
     end
   else
     if @user.present?
       Group.update(name: "#{@group}")
       @user.user_groups.update(group_id: params[:id], user_id: @user[:id])
     else
       Group.update(name: "#{@group}")
     end
   end
     redirect_to  "/"
  end

  def create
   if Group.find_by(name: params[:name]).present?
     redirect_to  "/"
   else
     @group = Group.create(group_params)
     @user = User.find_by(name: params[:user_name])
     if @user.present?
        user_ids = []
        user_ids << current_user.id
        user_ids << @user.id
          user_ids.each do |id|
            @group.user_groups.create(group_id: @group.id, user_id: id)
          end
        redirect_to  "/"
      else
        @group.user_groups.create(group_id: @group.id, user_id: current_user.id)
        redirect_to  "/"
     end
   end
  end

  private

  def group_params
  params.permit(:name)
  end
end

