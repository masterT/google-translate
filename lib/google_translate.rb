require 'google_translate/version'
require 'net/http'
require 'json'

BASE_URL = 'https://translate.googleapis.com/translate_a/single'.freeze

module GoogleTranslate
  def self.translate(text, options)
    # Validations
    unless options.is_a?(Hash)
      raise ArgumentError, 'Expect options to be a Hash.'
    end
    source_language = options.fetch(:source, options.fetch('source', 'auto'))
    target_language = options.fetch(:target, options['target'])
    if target_language.to_s.strip.empty?
      raise ArgumentError, "Expect options 'target'."
    end

    response = request(
      client: 'gtx',
      sl: options.fetch(:source, 'auto'),
      tl: options[:target],
      dt: 't',
      q: text
    )

    case response
    when Net::HTTPSuccess
      begin
        data = JSON.parse(response.body)
        data.dig(0, 0, 0)
      rescue JSON::JSONError
        raise ArgumentError, 'Server return none JSON response.'
      end
    else
      raise ArgumentError, 'Invalid server response.'
    end
  end

  def self.request(params)
    uri = URI(BASE_URL)
    uri.query = URI.encode_www_form(params)

    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'

    use_ssl = uri.scheme == 'https'
    Net::HTTP.start(uri.hostname, uri.port, use_ssl: use_ssl) do |http|
      http.request(request)
    end
  end
end
