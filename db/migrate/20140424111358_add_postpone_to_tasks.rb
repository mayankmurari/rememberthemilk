class AddPostponeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :postpone, :date, :default => Time.now
  end
end
