#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.program do
  xml.program_title "#{@program.title}"
  xml.program_description "#{@program.description}"
  xml.program_hint "zakk Monatsprogramm (XML Export for Adobe Indesign)"
  xml.part do

    xml.part_title "das zakk programm"

    for event in @program.events.with_ptype('0').order(:startdate)
      xml.event do
        xml.event_title event.title
        if event.shortext
          xml.event_text event.shortext
        end
        if event.startdate
          xml.event_starttime event.starttime
          xml.event_startdate event.startday + " " + event.startweekday
        end
      end
    end
  end

  xml.part do

    xml.part_title "und sonst?"

    for event in @program.events.with_ptype('2').order(:startdate)
      xml.event do
        xml.event_title event.title
        if event.shortext
          xml.event_text event.shortext
        end
        if event.startdate
          xml.event_starttime event.starttime
          xml.event_startdate event.startday + " " + event.startweekday
        end

        if event.location
          xml.event_location event.location.title
        end
      end
    end
  end
end