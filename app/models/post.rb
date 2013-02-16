class Post < ActiveRecord::Base
  attr_accessible :description, :title, :image, :deviantart, :lulu
  has_attached_file :image, styles: { thumb: "200x200" }

end
