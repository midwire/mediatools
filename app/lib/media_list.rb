# frozen_string_literal: true

class MediaList
  attr_accessor :file_collection

  # Walk the directories finding all pertinent media files
  #
  # @param directories [Array] Collection of paths for media files
  # @return [Array] Collection of all media files
  def initialize(directories)
    @file_collection = []
    directories.each do |directory|
      Dir["#{directory}/**/*"].each do |entry|
        file_collection << entry if Medium.media_file?(entry)
      end
    end
    file_collection
  end
end
