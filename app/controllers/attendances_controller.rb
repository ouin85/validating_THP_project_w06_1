class AttendancesController < ApplicationController
  before_action :not_able_to_register_to_event, only: [:new]
  before_action :no_rights_to_show_event_attendances, only: [:index]
  
  def index
    @event = Event.find(params[:event_id])
  end

  def new
    @event = Event.find(params[:event_id])
  end
  
  def create
    @attendance = Attendance.new(attendance_params) 
    if @attendance.save
      flash[:notice] = 'You are successfully registered to the event !'
      redirect_to event_path(attendance_params[:occasion_id])
    else
      render :new
    end
  end
  
  private
  def attendance_params
    params.permit(:occasion_id, :participant_id)
  end
  
  def not_able_to_register_to_event
    @event = Event.find(params[:event_id])
    if is_event_admin_of?(@event) || is_already_registered_to?(@event)
      flash[:danger] = "You are already registerer to this event or you are event admin !"
      redirect_to event_path(@event.id)
    end
  end

  def no_rights_to_show_event_attendances
    @event = Event.find(params[:event_id])
    unless is_event_admin_of?(@event)
      flash[:danger] = "Wise guy ! You can't show attendances of event for which you aren't admin !"
      redirect_to event_path(@event.id)
    end
  end
end