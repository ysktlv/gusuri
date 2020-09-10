class ReflectionsController < ApplicationController
  before_action :move_to_login
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  def index
    @reflections = Reflection.where(user_id: current_user.id)
    @reflection = Reflection.new
  end

  def create
    @reflections = Reflection.where(user_id: current_user.id)
    @reflection = Reflection.new(reflection_params)

    if @reflection.save
      redirect_to reflections_path(@reflection)
    else
      render :index
    end
  end

  def show
    @points = []
    @reflection.goal_reflections.each do |goal_reflection|
      @points.push(goal_reflection.goal.point)
    end
    if TotalPoint.exists?(reflection_id: @reflection.id)
      @totalpoint = TotalPoint.find_by(reflection_id: @reflection.id)
      @totalpoint.point = @points.sum
      @totalpoint.save
    else
      TotalPoint.create(point: @points.sum, reflection_id: @reflection.id)
    end
    @total_point = TotalPoint.find_by(reflection_id: @reflection.id)
  end

  def edit
    redirect_to root_path unless logged_in? && current_user.id == @reflection.user_id
  end

  def update
    if @reflection.update(reflection_params)
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
    params.require(:reflection).permit(:start_time, :impression, {goal_ids: []}).merge(user_id: current_user.id)
  end

  def set_reflection
    @reflection = Reflection.find(params[:id])
  end
end
