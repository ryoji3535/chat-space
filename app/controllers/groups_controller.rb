class GroupsController < ApplicationController

  def new
  end

  def edit
    @edit_group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    @group.update(name: params[:name])
    redirect_to  "/"
  end

  def create
    @group = Group.create(group_params)
    @group.update(name: params[:name])
    redirect_to  "/"
  end

  def group_params
      params.require("group").permit(:name, {:user_ids => []})
  end

end
