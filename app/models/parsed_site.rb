require 'uri'
class ParsedSite < ActiveRecord::Base
  validates :url, presence: true
  validate :valid_url
  has_many :url_html_tags

  def valid_url
    !!URI.parse(url)
  rescue URI::InvalidURIError
    false
  end
end
