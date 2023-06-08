class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :token, null: false#, index: { unique: true }
      t.string :full_path, null: false#, index: { unique: true }

      t.timestamps
    end
  end
end
