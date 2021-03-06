class CreateMediaContainers < ActiveRecord::Migration
  def change
    create_table :media_containers do |t|
      t.string :kind
      t.string :source
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
