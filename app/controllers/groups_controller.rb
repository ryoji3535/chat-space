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

    gname = params[:group_name]
    uname = params[:user_name]
    @test_group = Group.find_by(name: gname)
    @user = User.find_by(name: uname)

    if @test_group.blank?
      @group = Group.create(name: gname)
      @group.user_groups.create(group_id: @group.id, user_id: current_user.id)
      if @user.present?
        @group.user_groups.create(group_id: @group.id, user_id: @user.id)
      end
    end
    redirect_to  "/"
  end

end

