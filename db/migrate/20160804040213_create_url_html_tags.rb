class CreateUrlHtmlTags < ActiveRecord::Migration
  def change
    create_table :url_html_tags do |t|
      t.string :tag
      t.text :content
      t.references :parsed_site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
