class ChangeAwardFieldName < ActiveRecord::Migration
  def self.up
    rename_column :awards, :award, :description
  end

  def self.down
    rename_column :awards, :description, :award
  end
end
