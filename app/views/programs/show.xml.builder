#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"

xml.program do
  xml.program_title "#{@program.title}"
  xml.program_description "#{@program.description}"
  xml.program_language "de"
  xml.program_generator "#{Settings.app_fullname} #{Settings.app_version}"

  xml.part do

    xml.part_title "das zakk programm"

    for post in @program.posts.with_ptype('0').order(:startdate)
      xml.post do
        xml.post_title post.title
        if post.shortext
          xml.post_text post.shortext
        end
        if post.longtext
          xml.post_longtext post.longtext
        end
        if post.startdate
          xml.post_date smart_date_display(post.startdate,post.enddate)

          xml.post_startdate post.startday + " " + post.startweekday
          xml.post_starttime post.starttime
        end

        if post.location
          xml.post_location post.location.title
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
        if post.longtext
          xml.post_longtext post.longtext
        end
        if post.startdate
          xml.post_date smart_date_display(post.startdate,post.enddate)

          xml.post_startdate post.startday + " " + post.startweekday
          xml.post_starttime post.starttime
        end

        if post.location
          xml.post_location post.location.title
        end
      end
    end
  end
end