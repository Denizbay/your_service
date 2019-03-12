class AddBackgroundToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :background, :string
  end
end
