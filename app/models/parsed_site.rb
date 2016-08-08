require 'uri'
class ParsedSite < ActiveRecord::Base
  validates :url, presence: true
  validate :valid_url
  has_many :url_html_tags
  has_many :url_links
  after_create :save_parsed_values

  def valid_url
    !!URI.parse(url)
  rescue URI::InvalidURIError
    false
  end

  def save_parsed_values
    HtmlUrlParser.new(self).save_parsed_values
  end
end
