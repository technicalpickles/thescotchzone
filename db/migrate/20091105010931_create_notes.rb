class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.text :body
      t.integer :user_id
      t.integer :scotch_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
