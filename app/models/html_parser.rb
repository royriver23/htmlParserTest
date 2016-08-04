require 'open-uri'
class HtmlParser
  attr_accessor :site
  attr_reader :nokogiri_object
  def initialize(site)
    self.site = site
    html_data = open(site).read
    @nokogiri_object = Nokogiri::HTML(html_data)
  end

  def save_parsed_values
    tags.each {|tag| UrlHtmlTag.create(tag)}
    links.each {|link| UrlLink.create(link)}
  end

  private

  def tags
    SiteConfig.html_tags_allowed.map do |tag|
      nokogiri_object.css(tag).map(&:text).reduce([]) do |memo, text|
        memo << {tag: tag, content: text, parsed_site: site}
        memo
      end
    end.flatten
  end

  def links
    links = nokogiri_object.css('a').map {|link| link.attribute('href').to_s}.uniq.sort.select{|href| href.any?}
    links.reduce([]) do |memo, link|
      memo << {link: link, parsed_site: site}
      memo
    end
  end
end
