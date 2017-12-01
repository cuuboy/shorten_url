class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :shortcut_id
      t.string :ip
      t.text :request
      t.text :referral

      t.timestamps
    end
  end
end
