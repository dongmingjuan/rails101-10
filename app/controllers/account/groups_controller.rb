class Account::GroupsController < ApplicationController
                  def index
                    @groups = current_user.participated_groups
                  end
                  def edit
                    @group = Group.find(params[:id])
                  end
                  def update
                    @group = Group.find(params[:id])
                    if @group.update(group_params)
                      redirect_to account_groups_path
                    else
                      render :edit
                    end
                  end
                  def destroy
                    @group = Group.find(params[:id])
                    @group.destroy
                    flash[:alert] = "Group is deleted"
                    redirect_to account_groups_path
                  end
                  def group_params
                    params.require(:group).permit(:title, :description)
                  end
end
