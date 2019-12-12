# frozen_string_literal: true

class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'b40a73787a49571372c6d202c9f0372dae3a1890'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |req|
      req.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      req.headers['Content-type'] = 'application/json'
      req.body = params.to_json
    end
  end



  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT) do |builder|
      builder.adapter :typhoeus
    end
  end
end
