module Forge
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :slug, :title, :body

    belongs_to :user, :class_name => 'Forge::User'
  end
end
