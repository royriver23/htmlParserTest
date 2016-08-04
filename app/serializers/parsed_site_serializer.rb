class ParsedSiteSerializer < ActiveModel::Serializer
  has_many :url_html_tags
  attribute :url, key: :site_parsed_url
  attributes :name
end
