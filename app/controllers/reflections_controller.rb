class ReflectionsController < ApplicationController
  before_action :move_to_login

  def index
    @reflections = Reflection.all
  end

  def create
    @reflection = Reflection.new(reflection_params)
    if @reflection.save
      redirect_to reflection_path(@reflection)
    else
      render :new
    end
  end

  def show
    @reflection = Reflection.find(params[:id])
    @points = []
    @reflection.goal_reflections.each do |goal_reflection|
      @points.push(goal_reflection.goal.point)
    end
  end

  private

  def move_to_login
    redirect_to root_path unless logged_in?
  end

  def reflection_params
    params.permit(:start_time, :impression, {goal_ids: []})
  end
end
