class ReflectionsController < ApplicationController
  before_action :move_to_login

  def index
    @goal = Goal.all
  end

  def new
  end

  def create
    @reflection = Reflection.new(reflection_params)
    if @reflection.save
      redirect_to reflections_path
    else
      render :new
    end
  end

  private

  def move_to_login
    redirect_to root_path unless logged_in?
  end

  def reflection_params
    params.permit(:impression, {goal_ids: []})
  end
end
