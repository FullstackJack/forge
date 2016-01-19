module Forgecms
  class PostRevision < ActiveRecord::Base
    belongs_to :post, class_name: 'Forgecms::Post'
  end
end
