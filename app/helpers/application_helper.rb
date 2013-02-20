module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
  def convert(fulltext)
    fulltext = fulltext.gsub(/<url="(https?:\/\/[\S]+)">(.+)<\/url>/) {"<a href=\"#{$1}\">#{$2}</a>"}
    fulltext = fulltext.gsub(/<url="(https?:\/\/[\S]+)">/) {"<a href=\"#{$1}\">#{$1}</a>"}
    fulltext = fulltext.gsub(/<color="(\w+)">(.+)<\/color>/) {"<span style=\"color:#{$1};\">#{$2}</span>"}
    fulltext = fulltext.gsub(/<img="(https?:\/\/[\S]+)">/) { "<img src=\"#{$1}\">" }
    fulltext
  end
end
