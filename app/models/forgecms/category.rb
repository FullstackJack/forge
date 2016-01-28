module Forgecms
  class Category < ActiveRecord::Base
    validates :name, presence: true
  end
end
