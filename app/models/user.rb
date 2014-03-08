class User < ActiveRecord::Base
  has_many :stories

  validates :email, presence: true

  has_and_belongs_to_many :favorite_stories,
    join_table: 'users_favorite_stories',
    class_name: 'Story'

  def as_json options={}
    options[:root] = true
    super options
  end
end
