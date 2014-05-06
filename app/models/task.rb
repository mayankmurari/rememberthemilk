class Task < ActiveRecord::Base
  validates :content, presence: true

  scope :inbox, -> { where(type: 'Inbox') }
  scope :personal, -> { where(type: 'Personal') }
  scope :study, -> { where(type: 'Study') }
  scope :work, -> {where(type: 'Work')}
  scope :inboxincompleted, -> {where(:type=> "Inbox", :completed=>false).order(priority: :desc)}
  scope :inboxcompleted, -> {where(:type=> "Inbox", :completed=>true).order(priority: :asc)}
  scope :personalincompleted, -> {where(:type=> "Personal", :completed=>false).order(priority: :desc)}
  scope :personalcompleted, -> {where(:type=> "Personal", :completed=>true).order(priority: :asc)}
  scope :alltasks, -> {where(:completed=>false).order(priority: :desc)}
  
end
