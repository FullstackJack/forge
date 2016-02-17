module Forgecms
  class User < ActiveRecord::Base
    enum role: [:user, :reviewer, :author, :admin]

    has_many :posts, :class_name => 'Forgecms::Post'

    after_initialize :set_default_role, :if => :new_record?

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
           #:omniauthable

    include DeviseTokenAuth::Concerns::User

    def set_default_role
      self.role ||= :user
    end

    def full_name
      "#{self.first_name} #{self.last_name}"
    end
  end
end
