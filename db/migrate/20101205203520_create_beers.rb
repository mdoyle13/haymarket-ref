class CreateBeers < ActiveRecord::Migration

  def self.up
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.text :awards
      t.date :date_tapped
      t.string :brewery
      t.decimal :price
      t.boolean :featured
      t.boolean :published
      t.integer :beer_category_id
      t.integer :position

      t.timestamps
    end

    add_index :beers, :id

    load(Rails.root.join('db', 'seeds', 'beers.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Beers"})

    Page.find_all_by_link_url("/beers").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/beers"})

    drop_table :beers
  end

end
