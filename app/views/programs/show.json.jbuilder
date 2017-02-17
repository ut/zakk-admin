json.name @program.title
json.description @program.description

json.posts @program.posts.with_ptype('0').order(:startdate) do |json, post|
  json.title post.title
  if post.shortext
    json.shortext post.shortext
  end
  if post.startdate
    json.date smart_date_display(post.startdate,post.enddate)
    json.startdate post.startday + " " + post.startweekday
    json.starttime post.starttime
  end

  if post.location
    json.location post.location.title
  end
end