module ApplicationHelper
  def date_br(date)
    date.nil? ? "" : I18n.l(date, format: '%d/%m/%Y')
  end
end
