class GroupsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    Group.create(group_params)
    redirect_to  "/"
  end

  private

  def group_params
  params.permit(:name)
  end
end
