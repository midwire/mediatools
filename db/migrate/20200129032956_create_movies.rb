# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.boolean :adult
      t.string :backdrop_path
      t.integer :budget
      t.string :homepage
      t.integer :tmdb_id
      t.string :imdb_id
      t.string :original_language
      t.string :original_title
      t.text :overview
      t.float :popularity
      t.string :poster_path
      t.date :release_date
      t.integer :revenue
      t.integer :runtime
      t.string :status
      t.string :tagline
      t.string :title
      t.boolean :video
      t.float :vote_average
      t.integer :vote_count
      t.string :filepath

      t.timestamps
    end
    add_index :movies, :filepath, unique: true
    add_index :movies, :adult
    add_index :movies, :tmdb_id
    add_index :movies, :imdb_id
    add_index :movies, :popularity
    add_index :movies, :release_date
    add_index :movies, :runtime
    add_index :movies, :status
    add_index :movies, :video
    add_index :movies, :vote_average
    add_index :movies, :vote_count
  end
end
