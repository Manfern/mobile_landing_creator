class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.belongs_to :page, index: true
      t.text :description
      t.string :author
      t.timestamps
    end
    # add_index :feedbacks, :page_id
  end
end
