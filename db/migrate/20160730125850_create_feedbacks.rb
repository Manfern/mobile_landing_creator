class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
