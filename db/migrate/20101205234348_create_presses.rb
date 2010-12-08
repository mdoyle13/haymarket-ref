class CreatePresses < ActiveRecord::Migration

  def self.up
    create_table :presses do |t|
      t.string :headline
      t.string :author
      t.string :publication
      t.text :content
      t.integer :pdf_id
      t.integer :position

      t.timestamps
    end

    add_index :presses, :id

    load(Rails.root.join('db', 'seeds', 'presses.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Presses"})

    Page.find_all_by_link_url("/presses").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/presses"})

    drop_table :presses
  end

end
