module Forge
  class Setting < ActiveRecord::Base
    validates :name, presence: true
  end
end
