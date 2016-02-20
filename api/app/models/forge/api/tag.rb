module Forgecms
  class Tag < ActiveRecord::Base
    has_many :forgecms_tag_links, dependent: :destroy, class_name: 'Forgecms::TagLink'
    has_many :forgecms_posts, through: :tag_links, class_name: 'Forgecms::Post'

    validates :name, presence: true
  end
end
