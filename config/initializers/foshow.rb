Foshow.configure do
  {
    views: { 'orders#new' => ['app/views/orders/_form.html.haml', 'app/views/orders/_item_fields.html.haml'] },
    javascripts: ["app/assets/javascripts/global.js", "app/views/orders/_item_fields_selleck_template.html.haml"]
  }
end
