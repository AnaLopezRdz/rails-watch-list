class AddImgUrlToList < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :img_url, :string
  end
end
