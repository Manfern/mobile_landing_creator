class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :discount
      t.string :name
      t.integer :price
      t.integer :price_old
      t.string :button_text
      t.string :string

      t.timestamps
    end
  end
end
