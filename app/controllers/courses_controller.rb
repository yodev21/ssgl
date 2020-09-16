class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
