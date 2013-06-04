module ApplicationHelper
  def error_messages_for(resource)
    render "layouts/error_message", resource: resource
  end
end
