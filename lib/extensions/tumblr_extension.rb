require 'addressable/uri'
require 'json'
require 'oauth2'
require 'rest-client'
require "ruby-debug"
Debugger.start
module Extensions
  module TumblrExtension
    def get_access_token(code)
      consumer = OAuth::Consumer.new( key, secret, {
        :site               => "http://www.tumblr.com",
        :scheme             => :header,
        :http_method        => :post,
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_path     => "/oauth/authorize"
      })

      request_token = consumer.get_request_token
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

    def get_tumblr_posts
      response = RestClient.get(Addressable::URI.new({
        :scheme => "http",
        :host => "api.tumblr.com",
        :path => "/v2/blog/justNeph.tumblr.com/posts"
      }).to_s, 
        :params => {
          "base-hostname" => "justNeph.tumblr.com",
          :api_key => Figaro.env.tumblr_key,
          :notes_info => "true"
          #:limit => 20
        }
      )
      parsed_response = JSON.parse(response)["response"]["posts"]
      formatted_posts = []
      parsed_response.each do |post|
        post_attr = {
          :id => post["id"],
          :type => post["type"],
          :date => post["date"].to_time.in_time_zone('Eastern Time (US & Canada)').strftime("%B %e, %Y %l:%M %p"),
          :url => post["short_url"]
        }
        formatted_posts << parse_posts(post_attr, post)
      end

      formatted_posts
    end

    private

    def parse_posts(post_attr, post)
      case post["type"]
      when "text"
        post_attr[:title] = post["title"]
        post_attr[:content] = post["body"]
      when "photo"
        post_attr[:title] = post["caption"]
        post_attr[:content] = post["photos"].collect{|x| x["original_size"]["url"]}
      when "quote"
        post_attr[:title] = post["source_title"]
        post_attr[:content] = {
          :source_url => post["source_url"],
          :text => post["text"],
          :source => post["source"]
        }
      when "link"
        post_attr[:title] = post["title"]
        post_attr[:content] = {
          :url => post["url"],
          :text => post["description"]
        }
      when "chat"
        post_attr[:title] = "Chat"
        post_attr[:content] = post["dialogue"]
      when "audio"
        post_attr[:title] = post["caption"]
        post_attr[:content] = post["player"]
      when "video"
        post_attr[:title] = post["source_title"]
        post_attr[:content] = {
          :caption => post["caption"],
          :video => post["player"]
        }
      when "answer"
        post_attr[:title] = post["question"]
        post_attr[:content] = {
          :answer => post["answer"],
          :asking_name => post["asking_name"]
        }
      end

      post_attr
    end
  end
end
