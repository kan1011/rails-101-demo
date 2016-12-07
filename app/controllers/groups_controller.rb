class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @forum = Forum.find(1)
    @group = @forum.groups.build(group_params)
    @group.group_users.each do |join|
      join.forum_id = @group.forum_id
    end
    @group.save!
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.group_users.each do |join|
      join.forum_id = @group.forum_id
    end
    @group.update(group_params)
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [], group_users_attributes: [:id, :forum_id])
  end
end
