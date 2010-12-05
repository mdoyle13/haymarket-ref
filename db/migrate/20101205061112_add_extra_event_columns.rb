class AddExtraEventColumns < ActiveRecord::Migration
  def self.up
    remove_column :events, :boat_id
    add_column :events, :event_type_id, :integer
    add_column :events, :featured, :boolean
    add_column :events, :price, :string
    add_column :events, :purchase_link, :string
    add_column :events, :editor, :string
    add_column :events, :published, :boolean
  end

  def self.down
    add_column :events, :boat_id, :integer
    remove_column :events, :event_type_id
    remove_column :events, :featured
    remove_column :events, :price
    remove_column :events, :purchase_link
    remove_column :events, :editor
    remove_column :events, :published
  end
end