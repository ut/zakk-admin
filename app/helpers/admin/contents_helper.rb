module Admin::ContentsHelper

  def col_for_select
    [["Col #1",1],["Col #2",2],["Col #3",3]]
  end

  def default_col
    1
  end


  def page_for_select
    Page.all.order(:title).map do |p|
      [p.title, p.id]
    end
  end


end
