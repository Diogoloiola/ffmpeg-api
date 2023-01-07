class ChangeTypeCurrentOs < ActiveRecord::Migration[7.0]
  def self.up
    change_table :projects do |t|
      t.change :current_os, :integer
    end
  end

  def self.down
    change_table :projects do |t|
      t.change :current_os, :string
    end
  end
end
