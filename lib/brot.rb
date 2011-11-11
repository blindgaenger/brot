require 'brot/version'
require 'brot/bot'
require 'protolink'
require 'slop'
require 'yaml'

module Brot
  extend self

  def start(config)
    protonet = Protolink::Protonet.open(config['server'], config['username'], config['password'], config['proxy'])
    puts "connected to protonet"

    bot_configs = config['bots']
    puts "found #{bot_configs.size} bots"

    bot_configs.each do |bot_config|
      bot = Bot.new(protonet, bot_config)
      bot.listen # TODO: don't stop here
    end
  end

end
