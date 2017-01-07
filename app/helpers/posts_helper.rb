module PostsHelper

  def location_for_select
    Location.all.order(:title).map do |p|
      [p.title, p.id]
    end
  end
  def program_for_select
    Program.all.order(:title).map do |p|
      [p.title, p.id]
    end
  end


  def ptype_for_select
      ["Programm","Neues im zakk","Und sonst?"]
  end

  def status_for_select
      # TODO: if we need a three-step workflow: ["Draft","Ready","Published"]
      ["Draft","Published"]
  end

  def smart_date_display(startdate,enddate)
    if !enddate
      startdate.strftime("%d.%m.%Y, %H:%M")
    elsif startdate > enddate
      startdate.strftime("%d.%m.%Y, %H:%M")
    elsif  startdate == enddate
      startdate.strftime("%d.%m.%Y, %H:%M")
    elsif startdate.to_date == enddate.to_date
      "#{startdate.strftime("%d.%m.%y, %H:%M")} ‒ #{enddate.strftime("%H:%M")}"
    else
      "#{startdate.strftime("%d.%m.%Y, %H:%M")} ‒ #{enddate.strftime("%d.%m.%Y, %H:%M")}"
    end

  end

end
