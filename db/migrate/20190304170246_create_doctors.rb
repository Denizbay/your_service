class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :address
      t.text :description
      t.references :field, foreign_key: true

      t.timestamps
    end
  end
end
