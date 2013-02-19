module NewsHelper
  def convert(fulltext)
    fulltext = fulltext.gsub(/\[url="(https?:\/\/[\S]+)"\s(\S+)\]/) {"<a href=\"#{$1}\">#{$2}</a>"}
  end
end
