module Forge
  class TagLink < ActiveRecord::Base
    belongs_to :target, polymorphic: true
    belongs_to :tag

    validates :target, presence: true
    validates :tag, presence: true
  end
end
