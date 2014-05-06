Given(/^a user visits tasks page$/) do
  Task.create(:content => "task inbox", :type => "Inbox")
  Task.create(:content => "task personal", :type => "Personal")
  Task.create(:content => "task work", :type => "Work")

  visit tasks_path
end

When(/^he types a task on textbox and press enter$/) do
  fill_in 'task_contenti', :with => 'test task inbox one'
  click_button 'task_form_inbox_submit' 
end

Then(/^he should see his task listed below$/) do
  visit tasks_path
  id=Task.last.id
  find(:id, "taski_#{id}")
end

When(/^he types a task on textbox under personal tab and press enter$/) do
  fill_in 'task_contentp', :with => 'test task personal'
  click_button 'task_form_personal_submit' 
end

Then(/^he should see his task listed under personal tab$/) do
  visit tasks_path
  id=Task.last.id
  find(:id, "taskp_#{id}")
end

When(/^he types a task on textbox under work tab and press enter$/) do
  fill_in 'task_contentw', :with => 'test task work'
  click_button 'task_form_work_submit'
end

Then(/^he should see his task listed under work tab$/) do
  visit tasks_path
  id=Task.last.id
  find(:id, "taskw_#{id}")
end

When(/^he types a task on textbox under study tab and press enter$/) do
  fill_in 'task_contents', :with => 'test task study'
  click_button 'task_form_study_submit'
end

Then(/^he should see his task listed under study tab$/) do
  visit tasks_path
  id=Task.last.id
  find(:id, "tasks_#{id}")
end





