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
        xml.event_title Event.title
        if Event.shortext
          xml.event_text Event.shortext
        end
        if Event.startdate
          xml.event_starttime Event.starttime
          xml.event_startdate Event.startday + " " + Event.startweekday
        end
      end
    end
  end

  xml.part do

    xml.part_title "und sonst?"

    for event in @program.events.with_ptype('2').order(:startdate)
      xml.event do
        xml.event_title Event.title
        if Event.shortext
          xml.event_text Event.shortext
        end
        if Event.startdate
          xml.event_starttime Event.starttime
          xml.event_startdate Event.startday + " " + Event.startweekday
        end

        if Event.location
          xml.event_location Event.location.title
        end
      end
    end
  end
end