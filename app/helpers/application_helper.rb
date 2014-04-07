module ApplicationHelper
  def page_title(title = '')
    (title.blank? ? 'Encontre o que precisa em Valença' : title) + ' - Sirva.me'
  end

  def page_description(description = '')
    description.blank? ? 'Somos um catálogo comercial visual que reúne as empresas e profissionais de Valença em um único local, de forma prática e elegante.' : description
  end

  def og_image(og_image = '')
    root_url[0..-2] + image_path(og_image.blank? ? 'layout/logo_og.png' : og_image)
  end

  def default_contact_email(label = 'fbazzarella@gmail.com', css_class = nil)
    mail_to 'fbazzarella@gmail.com', label, title: 'Envie-nos um e-mail. Ficaremos felizes!', class: css_class
  end

  def back_to_catalog_path(params = {})
    return root_path if params[:encontrar].blank?

    root_path +
    (params[:format] == 'js' ? '#!/encontrar/' : '?encontrar=') +
    sanitize(params[:encontrar], :back)
  end

  def sanitize(params = nil, direction = nil)
    return nil if params.nil? || direction.nil?

    params = params.gsub(/,|\s|\++/i, '+').split('+') - ['']
    params.any? ? params.join({go: ' ', back: '+'}[direction]) : nil
  end

  def account_token_for(service = nil)
    {
      analytics: 'UA-30669028-2',
      addthis:   'ra-4e8a7fd659dbd41c'
  	}[service]
  end
end
