class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :id
      t.string  :uuid
      t.string  :url
      t.binary  :body, :limit => 10.megabyte
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
