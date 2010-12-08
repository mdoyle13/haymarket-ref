class CreateFoods < ActiveRecord::Migration

  def self.up
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :food_category_id
      t.boolean :daily_special
      t.decimal :price
      t.boolean :published
      t.integer :position

      t.timestamps
    end

    add_index :foods, :id

    load(Rails.root.join('db', 'seeds', 'foods.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Foods"})

    Page.find_all_by_link_url("/foods").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/foods"})

    drop_table :foods
  end

end
