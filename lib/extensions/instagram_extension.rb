require 'addressable/uri'
require 'json'
require 'oauth2'
require 'rest-client'
require 'ruby-debug'
Debugger.start
module Extensions
  module InstagramExtension
    def authorize_url
      # Step 1: generate URL that user visits to authorize
      # paste into browser, authorize, get code param
      url = Addressable::URI.new({
        :scheme => "https",
        :host => "api.instagram.com",
        :path => "/oauth/authorize",
        :query_values => {
          :client_id => Figaro.env.instagram_client_id ,
          :scope => "basic",
          :redirect_uri => "http://justNeph.com",
          :response_type => "code",
          :state => "justNeph"
        }
      })
      
      url.to_s
    end

    def get_access_token(code)
      # Step 2: paste in temporary code, request permanent access_token
      response = RestClient.post(Addressable::URI.new({
        :scheme => "https",
        :host => "api.instagram.com",
        :path => "/oauth/access_token",
      }).to_s, {
        :client_id => Figaro.env.instagram_client_id,
        :redirect_uri => "http://justNeph.com",
        :response_type => "token"
      })

      JSON.parse(response)["access_token"]
    end
  end
end