class CreateEventInquiries < ActiveRecord::Migration

  def self.up
    create_table :event_inquiries do |t|
      t.string :date
      t.string :time
      t.string :num_people
      t.string :occasion
      t.string :phone
      t.string :email
      t.text :notes
      t.text :extra_requirements
      t.integer :position

      t.timestamps
    end

    add_index :event_inquiries, :id

    load(Rails.root.join('db', 'seeds', 'event_inquiries.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Event Inquiries"})

    Page.find_all_by_link_url("/event_inquiries").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/event_inquiries"})

    drop_table :event_inquiries
  end

end
