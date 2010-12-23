class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :name
      
      t.string :file_identifier
      t.string :file_extension
      t.integer :file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
