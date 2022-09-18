class CreateCoincidences < ActiveRecord::Migration[7.0]
  def change
    create_table :coincidences do |t|
      t.text :description
      t.references :comment, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
