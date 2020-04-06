class CreateTvShows < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_shows do |t|
      t.string :backdrop_path
      t.date :first_air_date
      t.string :homepage
      t.integer :tmdb_id
      t.boolean :in_production
      t.date :last_air_date
      t.string :name
      t.date :next_episode_to_air
      t.integer :number_of_episodes
      t.integer :number_of_seasons
      t.string :origin_country
      t.string :original_language
      t.string :original_name
      t.text :overview
      t.float :popularity
      t.string :poster_path
      t.string :status
      t.string :type
      t.float :vote_average
      t.integer :vote_count
      t.string :filepath

      t.timestamps
    end
    add_index :tv_shows, :tmdb_id
    add_index :tv_shows, :first_air_date
    add_index :tv_shows, :in_production
    add_index :tv_shows, :last_air_date
    add_index :tv_shows, :name
    add_index :tv_shows, :next_episode_to_air
  end
end
