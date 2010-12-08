class CreateAwards < ActiveRecord::Migration

  def self.up
    create_table :awards do |t|
      t.string :event_name
      t.string :category
      t.string :beer_name
      t.string :award
      t.datetime :year
      t.integer :position

      t.timestamps
    end

    add_index :awards, :id

    load(Rails.root.join('db', 'seeds', 'awards.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Awards"})

    Page.find_all_by_link_url("/awards").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/awards"})

    drop_table :awards
  end

end
