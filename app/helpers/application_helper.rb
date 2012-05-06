module ApplicationHelper

  def show_code(file_array, lang=:ruby)
    "".tap do |html_string|
      file_array.each do |file|
        html_string << highlighted_code(file,lang)
      end
    end.html_safe
  end

  private

  def highlighted_code(file, lang=:ruby)
    CodeRay.scan(code_string(file), lang).div
  end


  def code_string(file)
    "".tap do |code|
      current_file(file).each do |line|
        code << line
      end
    end
  end

  def current_file(file)
    File.open(file)
  end

end
