class GroupsController < ApplicationController

  def new
  end

  def edit
    @edit_group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @menber = @group.users
    @user = User.find_by(name: params[:user_name])
    if @group.name == params[:group_name]
      if @user.present?
        @user.user_groups.update(user_id: @user.id)
      end
    else
      if @user.present?
        @group.update(name: params[:group_name])
        @user.user_groups.update(group_id: params[:id], user_id: @user.id)
      else
        @group.update(name: params[:group_name])
      end
    end
    redirect_to  "/"
  end

  def create

    gname = params[:group_name]
    uname = params[:user_name]
    @test_group = Group.find_by(name: gname)
    @user = User.find_by(name: uname)

    if test_group.blank?
      @group = Group.create(name: gname)
      @group.user_groups.create(group_id: @group.id, user_id: current_user.id)
      if @user.present?
        @group.user_groups.create(group_id: @group.id, user_id: @user.id)
      end
    end
    binding.pry
    redirect_to  "/"
  end
#def create
#    if Group.find_by(name: params[:group_name]).present?
#    else
#      @group = Group.create(group_params)
#      @user = User.find_by(name: params[:user_name])
#      if@user.present?
#        user_ids = []
#        user_ids << current_user.id
#        user_ids << @user.id
#          user_ids.each do |id|
#            @group.user_groups.create(group_id: @group.id, user_id: id)
#          end
#       else
#         @group.user_groups.create(group_id: @group.id, user_id: current_user.id)
#      end
#    end
#    redirect_to  "/"
#  end

  private
    def group_params
      params.permit(:name)
    end
end

