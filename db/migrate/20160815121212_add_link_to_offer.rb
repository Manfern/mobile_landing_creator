class AddLinkToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :link, :string
  end
end
