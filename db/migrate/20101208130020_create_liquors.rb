class CreateLiquors < ActiveRecord::Migration

  def self.up
    create_table :liquors do |t|
      t.string :name
      t.boolean :published
      t.decimal :price
      t.integer :position

      t.timestamps
    end

    add_index :liquors, :id

    load(Rails.root.join('db', 'seeds', 'liquors.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Liquors"})

    Page.find_all_by_link_url("/liquors").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/liquors"})

    drop_table :liquors
  end

end
