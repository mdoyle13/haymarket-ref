class CreateTestimonials < ActiveRecord::Migration

  def self.up
    create_table :testimonials do |t|
      t.string :name
      t.string :city
      t.text :testimonial
      t.integer :position

      t.timestamps
    end

    add_index :testimonials, :id

    load(Rails.root.join('db', 'seeds', 'testimonials.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Testimonials"})

    Page.find_all_by_link_url("/testimonials").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/testimonials"})

    drop_table :testimonials
  end

end
