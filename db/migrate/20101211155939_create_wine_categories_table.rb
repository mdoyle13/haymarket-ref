class CreateWineCategoriesTable < ActiveRecord::Migration
  def self.up
		create_table :wine_categories, :force => true do |t|
		  t.string :name
		  t.timestamps
		end
    add_column :wines, :wine_category_id, :integer
  end

  def self.down
    remove_column :wines, :wine_category_id
    drop_table :wine_categories
  end
end