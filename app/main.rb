require "sinatra/base"
require "sinatra/json"
require 'whois'
require 'whois-parser'

class SlimConverter < Sinatra::Base
  before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  end

  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
  end

  get '/' do
    json status: :ok
  end

  post '/check' do
    whois = Whois::Client.new
    supported_tlds = [:com, :net, :org, :io]
    json_data = []

    supported_tlds.each do |tld|
      domain = "#{params[:domain].split('.')[0]}.#{tld}"
      record = whois.lookup(domain)
      json_data << { domain => record&.parser&.available? }
    end

    json(json_data)
  end
end
