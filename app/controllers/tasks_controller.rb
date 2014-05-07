class TasksController < ApplicationController
  before_filter :authenticate_user!
  # before_action :set_task, only: [:show, :edit]
  layout 'another'
  
  # params[:order_by]
  # ["priority", "postpone", "content"]
  
  def index
    @task =  Task.new
    @tasks = Task.all
    @count = @tasks.count
    @order_by = ["priority", "postpone", "content"].include?(params[:order_by]) ?  params[:order_by] : "priority"
    @tasks=Task.order_tasks(@order_by, 'DESC')  
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
    @tasks = Task.all
    @task = Task.new(task_params)
    @counts = {inbox: Task.inbox.count, personal: Task.personal.count, study: Task.study.count, work: Task.work.count, all: Task.count}
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
  end
 
  def complete
    @set_priority = ["1","2","3"].include?(params[:commit]) ? params[:commit] : 0
    Task.priority(@set_priority,params[:task_id])
    @move_to = ["Inbox", "Personal", "Work", "Study"].include?(params[:commit]) ? params[:commit] : "Inbox"
    Task.move(@move_to,params[:task_id])
    if params[:completebutton]
      Task.completed(params[:task_id])
    elsif params[:postponebutton]
      Task.postpone(params[:task_id])
    elsif params[:deletebutton]
     Task.destroy(params[:task_id])  
    elsif params[:setup]  
      move_priority_up
    elsif params[:setdown]  
      move_priority_down
    end  
    redirect_to tasks_path
  end


  def incomplete
    @task=Task.all
    respond_to do |format|
      format.html {redirect_to '/tasks'}
      format.js {}
    end     
    @move_to_incomplete = ["Inbox", "Personal", "Work", "Study"].include?(params[:commit]) ? params[:commit] : "Inbox"
    Task.move_incomplete(@move_to_incomplete,params[:task_id])
    if params[:incompletebutton]
      Task.incompleted(params[:task_id]) 
    elsif params[:indeletebutton]
      Task.destroy(params[:task_id])  
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
