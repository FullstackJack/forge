module Forgecms
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :slug, :title, :body
  end
end
