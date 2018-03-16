module EventsHelper

  def location_for_select
    Location.all.order(:title).map do |p|
      [p.title, p.id]
    end
  end

  def default_location_id
    d = Location.where("title LIKE ?","%zakk%").first
    if d
      d.id
    else
      nil
    end
  end

  def program_for_select
    Program.all.order(:title).map do |p|
      [p.title, p.id]
    end
  end

  def current_program_id
    d = Program.where('current = ?', true).first
    if d.present?
      d.id
    else
      nil
    end
  end


  def ptype_for_select
    [["Programm","0"],["Neues im zakk","1"],["Und sonst?","2"]]
  end

  def default_ptype
    "0"
  end

  def status_for_select
    # TODO: if we need a three-step workflow: ["Draft","Ready","Published"]
    ["Draft","Published"]
  end

  def default_status
    status_for_select[0]
  end

  def smart_date_display(startdate,enddate)
    if !enddate
      "#{I18n.l(startdate, format: '%A')[0..1]} #{startdate.strftime("%d.%m.%y, %H:%M")}"
    elsif startdate > enddate
      "#{I18n.l(startdate, format: '%A')[0..1]} #{startdate.strftime("%d.%m.%y, %H:%M")}"
    elsif  startdate == enddate
      "#{I18n.l(startdate, format: '%A')[0..1]} #{startdate.strftime("%d.%m.%y, %H:%M")}"
    elsif startdate.to_date == enddate.to_date
      "#{I18n.l(startdate, format: '%A')[0..1]} #{startdate.strftime("%d.%m.%y, %H:%M")} ‒ #{enddate.strftime("%H:%M")}"
    else
      "#{I18n.l(startdate, format: '%A')[0..1]} #{startdate.strftime("%d.%m.%y, %H:%M")} ‒ #{I18n.l(enddate, format: '%A')[0..1]} #{enddate.strftime("%d.%m.%y, %H:%M")}"
    end

  end

end
