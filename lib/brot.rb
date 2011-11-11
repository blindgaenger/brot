require 'brot/version'
require 'brot/bot'
require 'brot/request'
require 'protolink'
require 'slop'
require 'yaml'

module Brot
  extend self

  def start(config)
    protonet = Protolink::Protonet.open(config['server'], config['username'], config['password'], config['proxy'])
    puts "connected to protonet"

    plugins = config['plugins']
    # TODO: check plugins to exist, resp. load them
    puts "found #{plugins.size} plugins"

    bot = Bot.new(protonet, plugins)
    bot.listen
  end

end
