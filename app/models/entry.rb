class Entry < ActiveRecord::Base
  has_many :entry_tags, dependent: :destroy
  has_many :tags, through: :entry_tags

  validates :name, :presence => true
  validates :content, :presence => true
end
