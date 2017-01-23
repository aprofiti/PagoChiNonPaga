module ApplicationHelper
  # Helper usato nelle views per messaggi Flash
  def bootstrap_class_for (flash_type)
    case flash_type
    when "success"
        "alert-success" # Green
      when "error"
        "alert-danger" # Red
      when "alert"
        "alert-warning" # Yellow
      when "notice"
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      tipo = bootstrap_class_for(msg_type)
      concat(content_tag(:div, message, class: "alert #{tipo} fade in") do
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message
            end)
    end
    nil
  end
end
