require 'hmac-sha1'

class String
  def hash_gsub(pattern, hash)
    gsub(pattern) do |m| 
      hash[m]
    end
  end
end

class Singleplatform
  
  def initialize
    sp_config = YAML.load_file("#{RAILS_ROOT}/config/singleplatform.yml")    
    @client_id = sp_config['client_id']
    @sig_key = sp_config['sig_key']
  end
  
  def signed_url(route)
    'http://api.singleplatform.co' + make_signature(route, {}, @client_id, @sig_key)
  end
  
  def make_signature(uri_path, params, client_id, secret)
    padding_factor = (4 - @sig_key.length % 4) % 4
    secret += "=" * padding_factor
    secret = secret.hash_gsub(/[-_]/, {"-" => "+", "_" => "/"})
    binary_key = Base64.decode64(secret)

    params.update({"client" => client_id})
    path = uri_path + "?" + params.collect{|k,v| "#{k}=#{v}"}.inject{|initial,cur| initial + "&" + cur}

    digest = HMAC::SHA1.new(binary_key).update(path).digest
    digest = Base64.encode64(digest).hash_gsub(/[+\/]/, {"+" => "-", "/" => "_"}).delete("=")
    return "#{path}&sig=#{digest}"
  end
  
  def request(post_url)  
    url = URI.parse(signed_url(post_url))
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url.request_uri)
    response = http.request(request)
    JSON.parse(response.body)
  end
  
  def get_items_between(items, string_key, first_item, second_item)
    filtered_items = Array.new
    show_item = false

    items.each_with_index do |item, index|
      show_item = true if item[string_key] == first_item
      show_item = false if item[string_key] == second_item
      filtered_items.push(item) if show_item == true
    end

    return filtered_items
  end
end