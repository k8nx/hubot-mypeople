{Robot, Adapter, TextMessage, EnterMessage, LeaveMessage, Response} = require 'hubot'

Iface = require 'mypeople'

class MyPeople extends Adapter
  send: (envelope, strings...) ->
    user = envelope.user
    channel = @iface
    target = user.friend.id
    if user.group.id
      target = user.group.id
      channel = @iface.group user.group.id

    strings.forEach (m) ->
      channel.sendMessage target, m

  reply: (envelope, strings...) ->
    user = envelope.user
    channel = @iface
    target = user.friend.id
    strings.forEach (m) ->
      channel.sendMessage target, m

  run: ->
    self = @
    options =
      key : process.env.HUBOT_MYPEOPLE_KEY
      nick : process.env.HUBOT_MYPEOPLE_NICK or @robot.name

    @robot.name = options.nick

    iface = new Iface.Receiver options.key
    iface.addListener 'message', (e) ->
      self.receive new TextMessage e, e.message
    iface.start()
    self.emit 'connected'

    @iface = iface

  #close: ->

  #receive: (message) ->

exports.use = (robot) ->
  new MyPeople robot
