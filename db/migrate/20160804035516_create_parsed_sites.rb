class CreateParsedSites < ActiveRecord::Migration
  def change
    create_table :parsed_sites do |t|
      t.string :url
      t.string :name

      t.timestamps null: false
    end
  end
end
