class CreateDoctorLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_languages do |t|
      t.references :doctor, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
