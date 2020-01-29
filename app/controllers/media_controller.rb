# frozen_string_literal: true

class MediaController < ApplicationController
  def index
    @media_counts = {
      movies: Movie.count,
      tv_shows: TvShow.count
    }
  end

  def create
    count = 0
    list = MediaList.new([params[:path]])
    list.file_collection.each do |file|
      media = Medium.build_instance(file)
      if media.nil?
        Rails.logger.debug { "Skipping [#{file}]" }
        next
      end
      count += 1
    end
    redirect_to media_url
  end
end
