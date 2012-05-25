module ApplicationHelper

  def code_viewer
    modify_defaults(yield) if block_given?
    content_tag(:section, id: 'code_viewer') do
      build_navigation + build_elements
    end.html_safe
  end

  def build_navigation
    content_tag(:nav) do
      "".tap do |html_container|
        default_directories.keys.each do |name|
          html_container << " #{link_to(name, '#', class: name)}"
        end
      end.html_safe
    end
  end

  def build_elements
    "".tap do |html_container|
      default_directories.each do |name, directory|
        html_container << content_tag(:div, class: "#{name}") { show_code(directory).html_safe }
      end
    end.html_safe
  end

  def default_directories
    @default_directories ||= {
      views: ["app/views/#{controller_name}/#{action_name}.html.haml"],
      controllers: ["app/controllers/#{controller_name}_controller.rb"],
      model: ["app/models/#{controller_name.singularize}.rb"],
      helpers: [],
      javascripts: [],
      stylesheets: [],
      all: []
    }
  end

  def modify_defaults(configuration)
    CodeViewer.each do |config, value|
      default_directories[config] = default_directories[config] << update_defaults(value)
    end
  end

  def update_defaults(value)
    if value.is_a?(Hash)
      value["#{controller_name}##{action_name}"] || []
    else
      value
    end
  end


  def show_code(file_array, lang=:ruby)
    "".tap do |html_string|
      file_array.flatten.each do |file|
        html_string << highlighted_code(file)
      end
    end
  end

  def highlighted_code(file)
    CodeRay.scan(" \#// #{file}\n\n" + code_string(file), file_lang(file)).div
  end

  def code_string(file)
    read_file(file)
  end

  def read_file(file)
    File.read(file)
  end

  def file_extension(file)
    File.extname(file)[1..-1]
  end

  def supported_file_types
    {
      ruby: "rb",
      javascript: "js",
      haml: "haml"
    }
  end

  def file_lang(file)
    supported_file_types.invert[file_extension(file)]
  end
end
