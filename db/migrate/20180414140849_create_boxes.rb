class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.text :name, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
