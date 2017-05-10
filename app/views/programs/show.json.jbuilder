json.title @program.title
json.description "zakk Monatsprogram"
json.publisher "zakk klubraum, Bremen"
json.language "de-DE"
json.identifier "http://zakk.klubraum.org"

json.posts do
  json.array! @program.posts.with_ptype('0').order(:startdate) do |post|
    json.title post.title
    json.type "Event"
    json.location "zakk klubraum, Sielpfad 11, D 28203 Bremen"
    if post.shortext
      json.description post.shortext
    end
    if post.startdate
      json.date post.startdate
      json.date_hr smart_date_display(post.startdate,post.enddate)
    end
    if post.location
      json.location post.location.title
    end
  end
end