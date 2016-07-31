class CreateAdvantages < ActiveRecord::Migration[5.0]
  def change
    create_table :advantages do |t|
      t.belongs_to :page, index: true
      t.text :description
      t.timestamps
    end
    # add_index :advantages, :page_id
  end
end
