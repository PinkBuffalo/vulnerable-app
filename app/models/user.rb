class User < ActiveRecord::Base
  has_many :stories

  has_and_belongs_to_many :favorite_stories,
    join_table: 'users_favorite_stories',
    class_name: 'Story'

  def favorite story
    favorite_stories << story
  end
end
