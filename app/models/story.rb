class Story < ActiveRecord::Base
  include Favoritable

  belongs_to :user

  can_favorite :user
end
