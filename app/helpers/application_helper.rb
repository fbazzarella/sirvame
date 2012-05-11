# encoding: utf-8
module ApplicationHelper
  def default_title
    'Encontre o que precisa em Valença - Sirva.me'
  end

  def default_description
    'Somos um catálogo comercial visual que reúne as empresas e profissionais de Valença em um único local, de forma prática e elegante. '
  end

  def default_og_image
    root_url[0..-2] + image_path('layout/logo2.png')
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