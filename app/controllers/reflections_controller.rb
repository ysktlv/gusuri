class ReflectionsController < ApplicationController
  before_action :move_to_login
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  def index
    @reflections = Reflection.all
    @reflection = Reflection.new
  end

  def create
    @reflection = Reflection.new(reflection_params)

    if @reflection.save
      redirect_to reflection_path(@reflection)
    else
      render :index
    end
  end

  def show
    @points = []
    @reflection.goal_reflections.each do |goal_reflection|
      @points.push(goal_reflection.goal.point)
    end
  end

  def edit
    redirect_to root_path unless logged_in? && current_user.id == @reflection.user_id
  end

  def update
    if @reflection.update(edit_reflection_params)
      redirect_to reflection_path(@reflection)
    else
      render :edit
    end
  end

  def destroy
    @reflection.destroy
    redirect_to reflections_path
  end

  private

  def move_to_login
    redirect_to root_path unless logged_in?
  end

  def reflection_params
    params.permit(:start_time, :impression, :user_id, {goal_ids: []}).merge(user_id: current_user.id)
  end

  def edit_reflection_params
    params.require(:reflection).permit(:start_time, :impression, :user_id, {goal_ids: []}).merge(user_id: current_user.id)
  end

  def set_reflection
    @reflection = Reflection.find(params[:id])
  end
end
