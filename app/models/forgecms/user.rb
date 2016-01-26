module Forgecms
  class User < ActiveRecord::Base
    enum role: [:user, :reviewer, :author, :admin]

    after_initialize :set_default_role, :if => :new_record?

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def set_default_role
      self.role ||= :user
    end

    def full_name
      "#{self.first_name} #{self.last_name}"
    end
  end
end
