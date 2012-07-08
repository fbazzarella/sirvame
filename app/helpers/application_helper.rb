# encoding: utf-8
module ApplicationHelper
  def page_title(title = '')
    (title.blank? ? 'Encontre o que precisa em Valença' : title) + ' - Sirva.me'
  end

  def page_description(description = '')
    description.blank? ? 'Somos um catálogo comercial visual que reúne as empresas e profissionais de Valença em um único local, de forma prática e elegante.' : description
  end

  def og_image(og_image = '')
    root_url[0..-2] + image_path(og_image.blank? ? 'layout/logo2.png' : og_image)
  end

  def default_contact_email(label = ENV['SMTP_ADDRESS'], css_class = nil)
    mail_to ENV['SMTP_ADDRESS'], label, title: 'Envie-nos um e-mail. Ficaremos felizes!', class: css_class
  end

  def back_to_catalog_url(referrer = request.referrer)
    referrer =~ /\:3000|sirva\.me|sirvame\.com/ ? 'javascript:history.back()' : root_path
  end

  def normalize_search_params(params = nil)
  	return nil if params.nil?
		params = params.gsub(/,|\s|\++/i, '+').split('+') - ['']
		params.any? ? params.join(', ') : nil
  end

  def account_token_for(service = nil)
  	{
  		analytics: 'UA-30669028-2',
  		mixpanel:  '6d5bc5a92a2b3d1600f2757133b6ae80',
      addthis:   'ra-4e8a7fd659dbd41c'
  	}[service]
  end
end