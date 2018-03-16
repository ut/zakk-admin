json.title @program.title
json.description "zakk Monatsprogram"
json.publisher "zakk klubraum, Bremen"
json.language "de-DE"
json.identifier "http://zakk.klubraum.org"

json.events do
  json.array! @program.events.with_ptype('0').order(:startdate) do |event|
    json.title Event.title
    json.type "Event"
    json.location "zakk klubraum, Sielpfad 11, D 28203 Bremen"
    if Event.shortext
      json.description Event.shortext
    end
    if Event.startdate
      json.date Event.startdate
      json.date_hr smart_date_display(Event.startdate,Event.enddate)
    end
    if Event.location
      json.location Event.location.title
    end
  end
end