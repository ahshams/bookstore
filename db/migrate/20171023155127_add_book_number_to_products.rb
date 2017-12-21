class AddBookNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :book_number, :string
  end
end
