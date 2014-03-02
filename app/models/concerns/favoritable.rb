module Favoritable
  extend ActiveSupport::Concern

  included do |base|
    base.extend ClassMethods
  end

  module ClassMethods
    class CantFavorite < StandardError
      def message
        "can_favorite requires favorite_stories to exist"
      end
    end

    # TODO: Add more robust type checking
    def can_favorite *entities
      entities.map(&:to_s).each do |entity|
        klass = entity.classify.constantize
        raise CantFavorite unless klass.instance_methods.include? :favorite_stories
      end
    end
  end

  def favorite_for entity
    entity.favorite_stories << self
  end

  def unfavorite_for entity
    entity.favorite_stories.destroy self
  end
end
