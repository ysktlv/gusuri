class GoalsController < ApplicationController
  before_action :move_to_login
  before_action :set_goal, only: [:edit, :update, :destroy]

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

  def edit
    redirect_to root_path unless logged_in? && current_user.id == @goal.user_id
  end

  def update
    if @goal.update(goal_params)
      redirect_to new_goal_path
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to new_goal_path
  end

  private

  def move_to_login
    redirect_to root_path unless logged_in?
  end

  def goal_params
    params.require(:goal).permit(:name, :point).merge(user_id: current_user.id)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end
end
