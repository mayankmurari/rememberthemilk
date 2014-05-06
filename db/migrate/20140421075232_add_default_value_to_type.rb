class AddDefaultValueToType < ActiveRecord::Migration
  def change
    change_column :tasks, :type, :string, :default => "Inbox"
  end
end
