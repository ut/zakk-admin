class FdatetimepickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: "#{attribute_name}_wrapper row collapse") do
      template.concat input_before
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat input_after
      template.concat icon_before
      template.concat icon
      template.concat icon_after

    end
  end

 def input_html_options
    {class: 'form-control fdatetimepicker optional', readonly: false}
  end

  def input_before
    '<div class="large-10 columns">'.html_safe
  end
  def input_after
    '</div>'.html_safe
  end

  def icon_before
    '<div class="small-2 columns">'.html_safe
  end
  def icon_after
    '
      </div>'.html_safe
  end







  def icon
    '<span class="postfix"><i class="fi-calendar fi-24"></i></span>'.html_safe
  end

end