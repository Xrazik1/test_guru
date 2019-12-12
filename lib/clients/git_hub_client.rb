# frozen_string_literal: true

class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |req|
      req.headers['Content-type'] = 'application/json'
      req.body = params.to_json
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end
