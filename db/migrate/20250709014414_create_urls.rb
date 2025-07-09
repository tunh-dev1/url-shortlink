class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :shorted_url, null:false

      t.timestamps
    end

    add_index :urls, :shorted_url, unique: true
  end
end
