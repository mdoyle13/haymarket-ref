class CreateWines < ActiveRecord::Migration

  def self.up
    create_table :wines do |t|
      t.string :name
      t.boolean :published
      t.decimal :glass_price
      t.decimal :bottle_price
      t.integer :position

      t.timestamps
    end

    add_index :wines, :id

    load(Rails.root.join('db', 'seeds', 'wines.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Wines"})

    Page.find_all_by_link_url("/wines").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/wines"})

    drop_table :wines
  end

end
