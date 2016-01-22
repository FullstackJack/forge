module Forgecms
  class Setting < ActiveRecord::Base
    validates :name, presence: true
  end
end
