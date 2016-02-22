module Forge
  class Tag < ActiveRecord::Base
    has_many :tag_links, dependent: :destroy, class_name: 'Forge::TagLink'
    has_many :posts, through: :tag_links, class_name: 'Forge::Post'

    validates :name, presence: true
  end
end
