# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.paginate(page: params[:page])
  end
end
