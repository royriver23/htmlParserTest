class CreateUrlLinks < ActiveRecord::Migration
  def change
    create_table :url_links do |t|
      t.string :link
      t.references :parsed_site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
