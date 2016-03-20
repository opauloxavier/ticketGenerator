module ApplicationHelper
  def full_title(page_title ='')
    base_title='18 anos Casal 20'
      if page_title.empty?
        page_title=base_title
      else
        base_title+' | '+ page_title
      end
  end
end
