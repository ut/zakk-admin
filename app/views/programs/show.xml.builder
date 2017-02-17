#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.program do
  xml.title "#{@program.title}"
  xml.description "#{@program.description}"
  xml.language "de"
  xml.generator "#{Settings.app_fullname} #{Settings.app_version}"

  xml.part do

    xml.title "das zakk programm"

    for post in @program.posts.with_ptype('0').order(:startdate)
      xml.post do
        xml.title post.title
        if post.shortext
          xml.shorttext post.shortext
        end
        if post.longtext
          xml.longtext post.longtext
        end
        if post.startdate
          xml.date smart_date_display(post.startdate,post.enddate)

          xml.startdate post.startday + " " + post.startweekday
          xml.starttime post.starttime
        end

        if post.location
          xml.location post.location.title
        end

      end
    end
  end

  xml.part do

    xml.title "und sonst?"

    for post in @program.posts.with_ptype('2').order(:startdate)
      xml.post do
        xml.title post.title
        if post.shortext
          xml.shorttext post.shortext
        end
        if post.longtext
          xml.longtext post.longtext
        end
        if post.startdate
          xml.date smart_date_display(post.startdate,post.enddate)

          xml.startdate post.startday + " " + post.startweekday
          xml.starttime post.starttime
        end

        if post.location
          xml.location post.location.title
        end

      end
    end
  end
end