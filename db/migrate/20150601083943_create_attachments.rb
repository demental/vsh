class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :media_container, index: true, foreign_key: true
      t.string :file

      t.timestamps null: false
    end
  end
end
