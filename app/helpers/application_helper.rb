module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  def convert(fulltext)
    fulltext = fulltext.gsub(/<url="(.+?)">(.+?)<\/url>/) {"<a href=\"#{$1}\">#{$2}</a>"}
    fulltext = fulltext.gsub(/<color="(\w+)">(.+)<\/color>/) {"<span style=\"color:#{$1};\">#{$2}</span>"}
    fulltext = fulltext.gsub(/<img="(.+?)">/) { "<img src=\"#{$1}\">" }
    fulltext = fulltext.gsub(/<thumb="(.+?)">/) { "<img src=\"#{$1}\" height=\"120\" width=\"120\">"}
    fulltext
  end
end
