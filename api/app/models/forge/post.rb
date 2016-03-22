module Forge
  class Post < ActiveRecord::Base
    before_validation :set_default_slug

    validates :title, presence: true
    validates :slug, uniqueness: true

    enum status: [ :draft, :review, :published ]
    enum visibility: [ :visible, :password_protected, :hidden ]

    has_many :comments, :class_name => 'Forge::Comment'
    has_many :post_revisions, :class_name => 'Forge::PostRevision'
    belongs_to :category, :class_name => 'Forge::Category'
    belongs_to :user, class_name: 'Forge::User'

    after_save :create_revision
    after_destroy :destroy_revisions

    def excerpt
      # Strip HTML tags
      str = ActionController::Base.helpers.strip_tags(body)
      # Limit the length of words.
      str.split[0...30].join(' ')
    end

    def set_default_slug
      if self.title.present? && self.slug.blank?
        self.slug = generate_slug
      end
    end

    def publish_by(user_id)
      self.update_attributes({published_by: user_id, published_at: Time.now, status: "published"})
    end

    protected

    def generate_slug
      self.title.downcase.strip.gsub(/\s/, '-').gsub(/[^\w-]/, '')
    end

    def create_revision
    end

    def destroy_revisions
    end
  end
end
