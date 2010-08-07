module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end
  
  def subtitle(sub_title)
    content_for(:sub_title) { sub_title }
  end

  def meta_keywords(keywords)
    content_for(:meta_keywords) { content_tag(:meta, nil, {:name => "keywords",  :content => keywords}) }
  end

  def meta_description(description)
    content_for(:meta_description) { content_tag(:meta, nil, {:name => "description",  :content => description}) }
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end

  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end

  def html5(hotlink_url)
    raw("<!--[if IE]><script src='#{hotlink_url}'></script><![endif]-->")
  end

end
