require 'brot/version'
require 'brot/bot'
require 'protolink'
require 'slop'

module Brot
  extend self

  def start(options)
    protonet = Protolink::Protonet.open(options[:server], options[:username], options[:password])
    puts "connected to protonet"

    bot = Bot.new(protonet)
    bot.listen
  end

end
