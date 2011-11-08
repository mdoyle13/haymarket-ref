class CreateSidebars < ActiveRecord::Migration

  def self.up
    create_table :sidebars do |t|
      t.string :title
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :sidebars, :id

    load(Rails.root.join('db', 'seeds', 'sidebars.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Sidebars"})

    Page.find_all_by_link_url("/sidebars").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/sidebars"})

    drop_table :sidebars
  end

end
