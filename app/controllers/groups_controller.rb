class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      redirect_to  group_messages_path(group), notice: "更新成功"
    else
      redirect_to  group_messages_path(group), alert: "更新失敗"
    end
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to  group_messages_path(group), notice: "作成成功"
    else
      redirect_to  root_path, alert:"作成失敗"
    end
  end

  private

  def group_params
      params.require("group").permit(:name, {user_ids: []})
  end
end
