class PostsGrid

  include Datagrid

  scope do
    Post.order("posts.startdate desc")
  end

  def row_class(post)
    if post.status != 'Published'
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
  column('', :html => true, :header => "Img") do |post|
    if post.image.url
      "<img src=\"#{post.image.medium_thumb.url}\">".html_safe
    else
      "#{image_tag('zakk_pattern3.png', :class => "medium_thumb placeholder_thumb", :with => '150', :height => '150')}".html_safe
    end
  end
  column(:title, :html => true) do |post|

    if post.program
      textcolor = post.program.textcolor1
    else
      textcolor = '#000'
    end



    if post.status != 'Published'
      link_to post, :class=>'post post_draft' do
        "<h3 style=\"color: #{textcolor}\">#{post.title}</h3>".html_safe
      end
    else
      link_to post, :class=>'post' do
        "<h3 style=\"color: #{textcolor}\">#{post.title}!!</h3>".html_safe
      end
    end
  end
  column('Date', :html => true, :order => true) do |post|
    if post.startdate
      smart_date_display(post.startdate,post.enddate)
    end
  end
  column('Metas', :html => true) do |post|
    if post.ptype
      c = "<span class='label label_ptype'>#{ptypes[post.ptype.to_i]}</span>"
    else
      c = "<span class='label label_pytpe'>?</span>"
    end
    if post.status
      c += "<br />"
      c += "<span class='label label_status'>#{post.status}</span>"
    end
    if post.program
      c += "<br />"
      c += "<span class='labelX label_program'>#{post.program.title}</span>"
    end
    c.html_safe


  end
  column(:shortext)
  column('Location', :html => true, :order => true) do |post|
    if post.location
      link_to "#{post.location.title}", post.location
    end
  end
  column('', :html => true) do |post|

    if can? :create, Post
      render partial: "/partials/post_publish", locals: { p: post }
    end
  end
  column('', :html => true) do |post|
    link_to edit_admin_post_path(post), :class=>"button tiny" do
      '<i class="fi-pencil fi-21"></i>Bearbeiten'.html_safe
    end
  end
  column('', :html => true) do |post|
    link_to copy_admin_post_path(post), :class=>"button tiny" do
      '<i class="fi-plus fi-21"></i>Kopieren'.html_safe
    end
  end
  column('', :html => true) do |post|
    link_to admin_post_path(post), :data => { confirm: 'Wirklich löschen?' }, :method => :delete, :class=>"button tiny alert" do
      '<i class="fi-x fi-21"></i>Löschen'.html_safe
    end
  end
end
