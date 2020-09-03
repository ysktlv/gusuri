class GoalsController < ApplicationController
  before_action :move_to_login

  def index
    @goals = Goal.all
  end

  def new
    @goals = Goal.all
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to new_goal_path
    else
      render :new
    end
  end

  private

  def move_to_login
    redirect_to root_path unless logged_in?
  end

  def goal_params
    params.require(:goal).permit(:name, :point).merge(user_id: current_user.id)
  end
end
