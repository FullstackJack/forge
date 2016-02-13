module Forgecms
  class PostSerializer < ActiveModel::Serializer
    attributes :id, :slug, :title, :body

    belongs_to :forgecms_user, :class_name => 'Forgecms::User'
  end
end
