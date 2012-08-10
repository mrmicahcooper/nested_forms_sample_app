Foshow.configure do |config|

  config.views = [
    {
     'orders#new' => ['app/views/orders/_form.html.haml', 'app/views/orders/_item_fields.html.haml'],
     'orders#show' => ['app/views/orders/_form.html.haml']
    }
  ]

  config.javascripts = [
    "app/assets/javascripts/global.js",
    "app/views/orders/_item_fields_selleck_template.html.haml"
  ]

end
