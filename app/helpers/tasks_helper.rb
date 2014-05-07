module TasksHelper
end
def move_priority_up
  Task.where(:id => params[:task_id]).each do |task|
    priority=task.priority 
    if (priority<3)
      priority=priority+1
      Task.where(:id => params[:task_id]).update_all(["priority=?",priority])
      flash[:notice] = "Successfully moved up" 
    else  
      flash[:notice] = "Priority already 3" 
    end  
  end 
end  

def move_priority_down
  Task.where(:id => params[:task_id]).each do |task|
    priority=task.priority 
    if (priority>1)  
      priority=priority-1
      Task.where(:id => params[:task_id]).update_all(["priority=?",priority])
      flash[:notice] = "Successfully moved down" 
    else
      flash[:notice] = "Priority already 1"  
    end                  
  end
end