class Task < ActiveRecord::Base
  validates :content, presence: true
  
    default_value_for :postpone do
      Date.today
    end

  searchable do
    text :content
  end 
    
  

  scope :inbox, -> { where(type: 'Inbox') }
  scope :personal, -> { where(type: 'Personal') }
  scope :study, -> { where(type: 'Study') }
  scope :work, -> {where(type: 'Work')}
  scope :inboxincompleted, -> {where(:type=> "Inbox", :completed=>false).order(priority: :desc)}
  scope :inboxcompleted, -> {where(:type=> "Inbox", :completed=>true).order(priority: :asc)}
  scope :personalincompleted, -> {where(:type=> "Personal", :completed=>false).order(priority: :desc)}
  scope :personalcompleted, -> {where(:type=> "Personal", :completed=>true).order(priority: :asc)}
  scope :alltasks, -> {where(:completed=>false).order(priority: :desc)}
  
  scope :order_tasks, lambda {|order_by, asc_or_desc| order("#{order_by} #{asc_or_desc}")}
  scope :priority, lambda {|set_priority,task_id| where(:id => task_id).update_all("priority=#{set_priority}")}
  scope :move, lambda {|move_to,task_id| where(:id => task_id).update_all("type='#{move_to}'")}
  scope :move_incomplete, lambda{|move_to_incomplete,task_id| where(:id => task_id).update_all("type='#{move_to_incomplete}'")}

  scope :completed, lambda{|task_id| where(:id => task_id).update_all(["completed=?",true])}
  scope :incompleted, lambda{|task_id| where(:id => task_id).update_all(["completed=?",false])}
  scope :postpone, lambda{|task_id| where(:id => task_id).update_all(["postpone=?",Date.tomorrow])}

  
end
