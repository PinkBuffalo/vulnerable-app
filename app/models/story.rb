class Story < ActiveRecord::Base
  include Favoritable
  can_favorite :user

  belongs_to :user

  scope :recent, ->{ limit(50) }
end
