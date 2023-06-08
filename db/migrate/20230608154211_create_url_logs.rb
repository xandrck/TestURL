class CreateUrlLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :url_logs do |t|
      t.belongs_to :url
      t.string :ip

      t.timestamps
    end
  end
end
