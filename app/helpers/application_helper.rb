module ApplicationHelper

  def controller?(controller)
    controller == params[:controller] ? true : false
  end

  def action?(action)
    action == params[:action] ? true : false
  end
end
