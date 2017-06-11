module ApplicationHelper

  def flash_message_tag(type, message)
    flash.discard(type)
    content_tag :div, class: [:alert, "alert-#{type}"] do
      concat link_to("&times;".html_safe, "", class: :close, data: { dismiss: :alert })
      concat message
    end
  end

  def flash_messages
    capture do
      flash.map { |type, msj| concat flash_message_tag(type, msj) }
    end
  end

  def icon(name, html_options = {})
    html_options[:class] = ['fa', "fa-#{name}", html_options[:class]].join(' ')
    content_tag :i, nil, html_options
  end

  def span_lock
    content_tag :span, nil, class: 'fa fa-lock', title: t(:protected_page)
  end

  def custom_form_for(object, *args, &block)
    options = args.extract_options!
    options[:wrapper] = :bootstrap3
    options[:defaults] = {input_html: {class: :'form-control'}}
    simple_form_for(object, *(args << options), &block)
  end

  def facebook_url
    'http://www.facebook.com/AcordesTotales'
  end

  def google_plus_url
    'https://plus.google.com/109491998330826037805'
  end

  def xaver_url
    'http://xaver.com.ar'
  end

end
