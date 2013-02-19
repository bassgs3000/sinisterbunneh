module NewsHelper
  def convert(fulltext)
    fulltext = fulltext.gsub(/<url="(https?:\/\/[\S]+)">(.+)<\/url>/) {"<a href=\"#{$1}\">#{$2}</a>"}
    fulltext = fulltext.gsub(/<color="(\w+)">(.+)<\/color>/) {"<span style=\"color:#{$1};\">#{$2}</span>"}
    fulltext
  end
end
