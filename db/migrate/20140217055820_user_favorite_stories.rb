class UserFavoriteStories < ActiveRecord::Migration
  def change
    create_table :users_favorite_stories, id: false  do |t|
      t.references :user
      t.references :story
    end
  end
end
