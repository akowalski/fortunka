# better defaults for textarea element

class TextInput < SimpleForm::Inputs::TextInput
  def input
    input_html_options.merge! :rows => 4
    super
  end
end
