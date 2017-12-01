class CreateShortcuts < ActiveRecord::Migration[5.1]
  def change
    create_table :shortcuts do |t|
      t.string :name
      t.text :note
      t.text :original_url
      t.string :short_url

      t.timestamps
    end
  end
end
