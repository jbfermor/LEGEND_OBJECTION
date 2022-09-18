class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :number
      t.references :comment_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end