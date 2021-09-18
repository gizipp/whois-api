require "sinatra/base"
require "sinatra/json"
require 'whois'
require 'whois-parser'

configure :production do
  require 'newrelic_rpm'
end

configure :development do
  require 'byebug'
end

class WhoisChecker < Sinatra::Base
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
    json_data = {}
    supported_tlds = [:com, :net, :org, :io, :xyz, :it]
    supported_tlds.each do |tld|
      domain = "#{params[:domain].split('.')[0]}.#{tld}"
      record = whois.lookup(domain)
      json_data[domain] = record&.parser&.available?
    end

    json json_data
  end

  post '/whois' do
    begin
      whois = Whois::Client.new
      json_data = {}
      json_data['data'] = whois.lookup(params[:domain]).to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      json json_data
    rescue
      json status: :error
    end
  end

  post '/ns' do
    begin
      whois = Whois::Client.new
      json_data = {}
      record = whois.lookup(params[:domain])
      json_data['ns'] = record&.parser.nameservers
      json json_data
    rescue
      json status: :error
    end
  end
end
