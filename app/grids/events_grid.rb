class EventsGrid

  include Datagrid

  scope do
    Event.order("events.startdate desc")
  end

  def row_class(event)
    if event.status != 'Published'
      "tr_draft"
    else
      "tr_published"
    end
  end


  filter(:id, :integer)
  filter(:title, :string) { |value| where("title ilike '%#{value}%'") }
  filter(:shortext, :string) { |value| where("shortext ilike '%#{value}%'") }
  filter(:startdate, :datetime, :range => true)

  column(:id, :header => "ID")
  column('', :html => true, :header => "Img") do |event|
    if event.image.url
      "<img src=\"#{event.image.medium_thumb.url}\">".html_safe
    else
      "#{image_tag('zakk_pattern3.png', :class => "medium_thumb placeholder_thumb", :with => '150', :height => '150')}".html_safe
    end
  end
  column(:title, :html => true) do |event|

    if event.program
      textcolor = event.program.textcolor1
    else
      textcolor = '#000'
    end



    if event.status != 'Published'
      link_to event, :class=>'event event_draft' do
        "<h3 style=\"color: #{textcolor}\">#{event.title}</h3>".html_safe
      end
    else
      link_to event, :class=>'event' do
        "<h3 style=\"color: #{textcolor}\">#{event.title}!!</h3>".html_safe
      end
    end
  end
  column('Date', :html => true, :order => true) do |event|
    if event.startdate
      smart_date_display(event.startdate,event.enddate)
    end
  end
  column('Metas', :html => true) do |event|
    if event.ptype
      c = "<span class='label label_ptype'>#{ptypes[event.ptype.to_i]}</span>"
    else
      c = "<span class='label label_pytpe'>?</span>"
    end
    if event.status
      c += "<br />"
      c += "<span class='label label_status'>#{event.status}</span>"
    end
    if event.program
      c += "<br />"
      c += "<span class='labelX label_program'>#{event.program.title}</span>"
    end
    c.html_safe


  end
  column(:shortext)
  column('Location', :html => true, :order => true) do |event|
    if event.location
      link_to "#{event.location.title}", event.location
    end
  end
  column('', :html => true) do |event|

    if can? :create, event
      render partial: "/partials/event_publish", locals: { p: event }
    end
  end
  column('', :html => true) do |event|
    link_to edit_admin_event_path(event), :class=>"button tiny" do
      '<i class="fi-pencil fi-21"></i>Bearbeiten'.html_safe
    end
  end
  column('', :html => true) do |event|
    link_to copy_admin_event_path(event), :class=>"button tiny" do
      '<i class="fi-plus fi-21"></i>Kopieren'.html_safe
    end
  end
  column('', :html => true) do |event|
    link_to admin_event_path(event), :data => { confirm: 'Wirklich löschen?' }, :method => :delete, :class=>"button tiny alert" do
      '<i class="fi-x fi-21"></i>Löschen'.html_safe
    end
  end
end
