class TasksController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_task, only: [:show, :edit]
  layout 'another'
  
  
  def index
    
    @task =  Task.new
    @tasks = Task.all
    @count = @tasks.count
    if params[:setbyprior]
      @tasks=Task.all.order("priority DESC")
    elsif params[:setbydate]  
      @tasks=Task.all.order("postpone ASC")  
    elsif params[:setbyname]
      @tasks=Task.all.order("content ASC")
    end   
  end

  def show   
   @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    
    redirect_to tasks_path
  end

  def create
    @task = Task.new(task_params)
    @counta = Task.count
    @counti = Task.inbox.count
    @countp = Task.personal.count
    @counts = Task.study.count
    @countw = Task.work.count
      respond_to do |format|
        if @task.save
          format.js {}
          format.html {redirect_to '/tasks'}
          
        else
          format.html { render action: "new"}  
        end
      end  
  end     

  def destroy
    
    Task.destroy(params[:task_id])
    respond_to do |format|
      format.html { redirect_to tasks_url}
      flash[:notice] = "Task successfully deleted"
      format.js { }
    end 
  end

  def complete
    
    priority=params[:task_id]
    if params[:completebutton]
      Task.where(:id => params[:task_id]).update_all(["completed=?",true])
      flash[:notice] = "Task successfully completed"
    elsif params[:postponebutton]
      Task.where(:id => params[:task_id]).update_all(["postpone=?",Time.now + 1.day])
      flash[:notice] = "Task successfully postponed for tomorrow"
    elsif params[:deletebutton]
      Task.destroy(params[:task_id])
      flash[:notice] = "Task successfully deleted" 
    elsif params[:set1]  
      Task.where(:id => params[:task_id]).update_all(["priority=?",1]) 
       flash[:notice] = "Priority Set to 1" 
    elsif params[:set2]  
      Task.where(:id => params[:task_id]).update_all(["priority=?",2]) 
       flash[:notice] = "Priority Set to 2"
    elsif params[:set3]  
      Task.where(:id => params[:task_id]).update_all(["priority=?",3]) 
       flash[:notice] = "Priority Set to 3" 
    elsif params[:movetopers]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Personal"]) 
       flash[:notice] = "Successfully moved to Personal" 
    elsif params[:movetoinb]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Inbox"]) 
       flash[:notice] = "Successfully moved to Inbox" 
    elsif params[:movetowork]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Work"]) 
       flash[:notice] = "Successfully moved to Work"  
    elsif params[:movetostd]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Study"]) 
       flash[:notice] = "Successfully moved to Study" 
    elsif params[:setup]  
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
    elsif params[:setdown]  
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
    redirect_to tasks_path
  end

  def incomplete

    @task=Task.all
    respond_to do |format|
      format.html {redirect_to '/tasks'}
      format.js {}
    end     
    if params[:incompletebutton]
      Task.where(:id => params[:task_id]).update_all(["completed=?",false])
      flash[:notice] = "Task successfully completed" 
    elsif params[:indeletebutton]
      debugger
      Task.destroy(params[:task_id])
      flash[:notice] = "Task successfully deleted"  
    elsif params[:inmovetopers]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Personal"]) 
       flash[:notice] = "Successfully moved to Personal" 
    elsif params[:inmovetoinb]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Inbox"]) 
       flash[:notice] = "Successfully moved to Inbox" 
    elsif params[:inmovetowork]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Work"]) 
       flash[:notice] = "Successfully moved to Work"  
    elsif params[:inmovetostd]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Study"]) 
       flash[:notice] = "Successfully moved to Study"    
    end
  end

  def incompletepersonal

    @task=Task.all
    respond_to do |format|
      format.html {redirect_to '/tasks'}
      format.js {}
    end     
    if params[:incompletebutton]
      Task.where(:id => params[:task_id]).update_all(["completed=?",false])
      flash[:notice] = "Task successfully completed" 
    elsif params[:indeletebutton]
      debugger
      Task.destroy(params[:task_id])
      flash[:notice] = "Task successfully deleted"  
    elsif params[:inmovetopers]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Personal"]) 
       flash[:notice] = "Successfully moved to Personal" 
    elsif params[:inmovetoinb]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Inbox"]) 
       flash[:notice] = "Successfully moved to Inbox" 
    elsif params[:inmovetowork]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Work"]) 
       flash[:notice] = "Successfully moved to Work"  
    elsif params[:inmovetostd]  
      Task.where(:id => params[:task_id]).update_all(["type=?","Study"]) 
       flash[:notice] = "Successfully moved to Study"    
    end
  end

  def overview
  end

  def locations
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_task
    #   @task = Task.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :type)
    end
end
