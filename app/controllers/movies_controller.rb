# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]

  def index
    @movies = Movie.paginate(page: params[:page])
  end

  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
