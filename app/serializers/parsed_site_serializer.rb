class ParsedSiteSerializer < ActiveModel::Serializer
  has_many :url_html_tags
  has_many :url_links
  attribute :url, key: :site_parsed_url
  attributes :name, :id
end
