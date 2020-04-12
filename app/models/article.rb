class Article < ApplicationRecord
  validates_presence_of :title
  belongs_to :author, class_name: 'User'
end
