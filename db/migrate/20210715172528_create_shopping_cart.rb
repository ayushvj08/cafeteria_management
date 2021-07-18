class CreateShoppingCart < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.string :menu_category_name
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.bigint :menu_item_price

      t.timestamps
    end
  end
end
