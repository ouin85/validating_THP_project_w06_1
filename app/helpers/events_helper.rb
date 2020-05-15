module EventsHelper
  def is_event_admin_of?(event)
    current_user.id == event.admin.id
  end

  def is_already_registered_to?(event)
    !Attendance.find_by(occasion_id: event.id, participant_id: current_user.id).nil?
  end

  def is_able_to_register_to?(event)
    !is_event_admin_of?(event) && !is_already_registered_to?(event)
  end
end
