require 'rest-client'
require 'yaml'

module Blugem
  GEM_ROOT = File.expand_path("../..", __FILE__)
  AUTH_INFO = YAML.load_file("#{GEM_ROOT}/config/blugem.yml")

  # => BluZone Authentication
  # BluZone still uses username/password auth
  class Auth
    # => Blugem::Auth.[method]
    @@API_URL = "https://bluzone.io/portal/"

    def self.login
      r = RestClient.post "#{@@API_URL}auth/slogin",
        {:username => AUTH_INFO["username"], :password => AUTH_INFO["password"]}.to_json,
        :content_type => :json,
        :accept => :json
      @authToken = JSON.parse(r.body)["authToken"]
      return @authToken
    end

    def self.post_request(path, options = {})
      request = RestClient.post
    end

    def self.get_request(path, options = {})
      return RestClient.get "#{@@API_URL}#{path}",
        {:cookies =>
          {:"X-BZ-AuthToken" => @authToken}
        }
    end

    def self.test
      # => Return authToken
      return @authToken
    end

    def self.version
      return Gem::VERSION
    end
  end

  class Session < Auth

    def self.ping
      get_request("pub/v1/session")
    end

  end

  class Blufitemplate < Auth

    def self.templates
      get_request("sapis/v1/provisioning/blufiTemplates")
    end

  end

end
