require 'open-uri'
class HtmlUrlParser
  attr_accessor :site
  attr_reader :nokogiri_object

  def initialize(site)
    self.site = site
    @nokogiri_object = Nokogiri::HTML(visit_site.html)
  end

  def visit_site
    sleep 2
    browser = Watir::Browser.new :phantomjs, args: %w(--ignore-ssl-errors=true)
    browser.goto(site.url)
    browser
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
    links = nokogiri_object.css('a').map {|link| link.attribute('href').to_s}.uniq.sort.select{|href| href.present?}
    links.reduce([]) do |memo, link|
      memo << {link: link, parsed_site: site}
      memo
    end
  end
end
