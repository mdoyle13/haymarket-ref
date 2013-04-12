class CreateHomeslides < ActiveRecord::Migration

  def self.up
    create_table :homeslides do |t|
      t.string :caption
      t.integer :photo_id
      t.string :video_embed
      t.integer :order
      t.boolean :is_video
      t.integer :position

      t.timestamps
    end

    add_index :homeslides, :id

    load(Rails.root.join('db', 'seeds', 'homeslides.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Homeslides"})

    Page.find_all_by_link_url("/homeslides").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/homeslides"})

    drop_table :homeslides
  end

end
