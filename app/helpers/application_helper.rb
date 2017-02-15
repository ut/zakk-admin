module ApplicationHelper

  def current_program
    p = Program.where('current = ?', true).first
    if p
      return p
    else
      p = Program.new
      p.backgroundcolor = '#ccc'
      p.textcolor1 = '#000'
      p.textcolor2 = '#555'
      return p
    end
  end

  def ptypes
    ["Programm","Neues im zakk","Und sonst?"]
  end


  def fuzzy date
    return '--' unless date
    I18n.with_options :scope => 'datetime.fuzzy' do |locale|
    	return I18n.localize date.to_date if date > DateTime.now
      return 'gerade eben' if 5.minutes.ago < date
      return 'vor einer Stunde' if 1.hour.ago < date
    	return 'heute, ' +  date.to_time.strftime("%H:%m") if Time.now.beginning_of_day < date
    	return 'gestern, ' +  date.to_time.strftime("%H:%m") if Time.now.beginning_of_day-1.day < date
    	return I18n.localize date.to_date
  	end
  end

  def labeled_textfield( form, field, label)
    "<p>#{form.label(field, label)}#{form.text_field field}</p>".html_safe
  end


  def link_to_with_highlight(name, options = {}, html_options = {}) # same syntax as #link_to
    if current_page?(options)
      html_options.merge!({ :class => 'act' })
    elsif options.match("admin") && params[:controller].match("admin/")
        html_options.merge!({ :class => 'act' })
    elsif options.match(params[:controller])
        html_options.merge!({ :class => 'act' })
    else
      html_options.merge!({ :class => params[:controller] })
    end
    link_to(name, options, html_options)
  end

end
