# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#

class Article < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_and_belongs_to_many :tags
end
