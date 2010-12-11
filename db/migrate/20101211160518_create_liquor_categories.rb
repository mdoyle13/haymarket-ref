class CreateLiquorCategories < ActiveRecord::Migration
  def self.up
		create_table :liquor_categories, :force => true do |t|
		  t.string :name
		  t.timestamps
		end
    add_column :liquors, :liquor_category_id, :integer
  end

  def self.down
    remove_column :liquors, :liquor_category_id
    drop_table :liquor_categories
  end
end
