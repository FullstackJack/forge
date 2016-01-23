module Forgecms
  class Post < ActiveRecord::Base
    validates :title, presence: true

    has_many :forgecms_comments, :class_name => 'Forgecms::Comment'
    has_many :forgecms_post_revisions, :class_name => 'Forgecms::PostRevision'
    belongs_to :forgecms_category, :class_name => 'Forgecms::Category'

    after_save :create_revision
    after_destroy :destroy_revisions

    def excerpt
      # Strip HTML tags
      str = ActionController::Base.helpers.strip_tags(body)
      # Limit the length of words.
      str = str.split[0...30].join(' ')
    end

    protected
      def create_revision
      end

      def destroy_revisions
      end
  end
end
