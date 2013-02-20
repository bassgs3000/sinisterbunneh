class Post < ActiveRecord::Base
  attr_accessible :description, :title, :image, :deviantart, :lulu
  has_attached_file :image, styles: { thumb: "200x200" }
  validates :title, presence: true
  validates_attachment :image,
    content_type: { content_type: ["image/jpg","image/jpeg","image/png","image/gif"] },
    attachment_presence: true,
    size: { in: 0..7.megabytes }
end
