class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :users, :through => :user_posts
  accepts_nested_attributes_for :comments
end
