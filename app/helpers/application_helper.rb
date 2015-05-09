module ApplicationHelper
  def full_title(page_title)
    base_title = 'Munchkin'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def mark_required(object, attribute)
    'required' if object.class.validators_on(attribute).map(&:class).include? ActiveRecord::Validations::PresenceValidator
  end

  def fi_icon(name, class_name = nil)
    content_tag(:i, nil, :class => "glyphicon glyphicon-#{name}#{(' ' + class_name) if class_name.present?}")
  end

  def bootstrap_class_for flash_type
    {success: "alert-success", error: "alert-danger", danger: "alert-danger", alert: "alert-warning", notice: "alert-success"}[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_icon_for flash_type
    {success: "ok-sign", error: "remove-sign", alert: "exclamation-sign", notice: "info-sign"}[flash_type.to_sym] || "question-sign"
  end

  def nav_link(link_text, link_path, controller = nil)
    class_name = 'navbar-link'
    class_name += ' active' if controller_name == controller

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def sortable_ingredient(column, title = nil)
    title ||= column.titleize
    css_class = (column == sortable_ingredient_column) ? "current #{sortable_ingredient_direction}" : nil
    direction = (column == sortable_ingredient_column && sortable_ingredient_direction == "asc") ? "desc" : "asc"
    link_to title, ingredients_path(params.merge(:sort => column, :direction => direction, :page => nil)), {:class => css_class}
  end


end
