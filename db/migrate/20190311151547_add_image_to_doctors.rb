class AddImageToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :image, :string
  end
end
