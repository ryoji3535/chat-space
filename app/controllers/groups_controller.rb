class GroupsController < ApplicationController

  def new
  end

  def edit
    @edit_group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @user = User.find_by(name: params[:user_name])

    @group.update(name: params[:group_name])
    @user.user_groups.update(group_id: params[:id], user_id: @user.id)
    redirect_to  "/"
  end

  def create
    @user = User.find_by(name: params[:user_name])
    user_ids = []
    user_ids << @user[:id] if @user.present?
    user_ids << current_user.id
    @group = Group.create(name: params[:name], user_ids: user_ids) if params[:name].present?
    redirect_to  "/"
  end

end
