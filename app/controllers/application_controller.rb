class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:show_files) do
    if action_name == 'new' || action_name == 'edit'
      [Rails.root + "app/views/#{controller_name}/#{action_name}.html.haml", Rails.root + "app/views/#{controller_name}/_form.html.haml", Rails.root + 'app/views/orders/_item_fields.html.haml']
    else
      [Rails.root + "app/views/#{controller_name}/#{action_name}.html.haml"]
    end
  end

end
