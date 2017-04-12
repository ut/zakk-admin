#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.program do
  xml.program_title "#{@program.title}"
  xml.program_description "#{@program.description}"
  xml.program_hint "zakk Monatsprogramm (XML Export for Adobe Indesign)"
  xml.part do

    xml.part_title "das zakk programm"

    for post in @program.posts.with_ptype('0').order(:startdate)
      xml.post do
        xml.post_title post.title
        if post.shortext
          xml.post_text post.shortext
        end
        if post.startdate
          xml.post_starttime post.starttime
          xml.post_startdate post.startday + " " + post.startweekday
        end
      end
    end
  end

  xml.part do

    xml.part_title "und sonst?"

    for post in @program.posts.with_ptype('2').order(:startdate)
      xml.post do
        xml.post_title post.title
        if post.shortext
          xml.post_text post.shortext
        end
        if post.startdate
          xml.post_starttime post.starttime
          xml.post_startdate post.startday + " " + post.startweekday
        end

        if post.location
          xml.post_location post.location.title
        end
      end
    end
  end
end