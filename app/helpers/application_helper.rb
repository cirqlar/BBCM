module ApplicationHelper

  def controller?(controller)
    controller == params[:controller] ? true : false
  end

  def action?(action)
    action == params[:action] ? true : false
  end

  def nester(nest)
    nest.map do |branch, leaves|
      render(branch) + content_tag(:div, nester(leaves), class: "children")
    end.join.html_safe
  end
end
