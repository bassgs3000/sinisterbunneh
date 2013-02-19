class News < ActiveRecord::Base
  attr_accessible :content, :title, :image, :date
  has_attached_file :image, styles: { thumb: "200x200" }
  validates :title, presence: true
  validates :content, presence: true
  validates_attachment :image, 
    content_type: { content_type: ["image/jpg","image/jpeg","image/png","image/gif"] },
    size: { in: 0..7.megabytes }
end
