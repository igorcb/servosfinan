module ApplicationHelper
  def full_title(page_title)
    base_title = "Servos Taxi"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end	

  def nav_link(text, path)
	  options = current_page?(path) ? { class: "active" } : {}
	  content_tag(:li, options) do
	    link_to text, path
	  end
  end  

  def date_br(date)
    date.nil? ? "" : I18n.l(date, format: '%d/%m/%Y')
  end

  def select_credito_debito
    ([['Crédito', 1], ['Débito', -1]])
  end
end
