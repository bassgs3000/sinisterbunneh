class News < ActiveRecord::Base
  attr_accessible :content, :title, :image, :date
  has_attached_file :image, styles: { thumb: "200x200" }
end
