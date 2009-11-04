class CreateScotches < ActiveRecord::Migration
  def self.up
    create_table :scotches do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end

  def self.down
    drop_table :scotches
  end
end
