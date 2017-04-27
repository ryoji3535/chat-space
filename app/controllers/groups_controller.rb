class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to  "/"
  end

  def create
    Group.create(group_params)
    redirect_to  "/"
  end

  private

  def group_params
      params.require("group").permit(:name, {:user_ids => []})
  end

end
