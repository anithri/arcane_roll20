
@ApiChatResponder = (@regExp, @respondWith)->
  return this

@ApiChatModule = (@name)->
  @responders = []
  @haltOnFirstMatch = true
  return this

ApiChatModule.prototype = {
  responders: []
  addResponder: (newResponder)->
    @responders.push newResponder
    return this
  addChatCommand: (regEx, respondWith)->
    c = new ApiChatResponder(regEx, respondWith)
    @addResponder c
    return this
  respondTo: (msg, who)->
    _.find @responders, (responder)->
      md = responder.regExp.exec(msg)
      return unless md.length > 0
      responder.respondWith(msg, md, who)
      return @haltOnFirstMatch
    return this
}

@ApiChatHandler = ()->
  @apiHandlers = {}
  @noClobber = false
  return this
  
ApiChatHandler.prototype = {
  addChatModule: (moduleObj)->
    @apiHandlers[moduleObj.name] = moduleObj
  processChatMessage: (message, who)->
    [moduleName, msg] = message.split " ",2
    return unless @apiHandlers[moduleName]?
    @apiHandlers[moduleName].respondTo(msg, who)
}

@ChatHandler ?= new ApiChatHandler

#@apiChatCommands = {}
#@addChatModule = (moduleName)->
#  apiChatCommands[moduleName] = []
#
#@addChatCommand = (moduleName, re, callBackTo)->
#  @apiChatCommands[moduleName] << {re: re, callBackTo: callBackTo}
#
#addChatModule "!fp"
#addChatCommand "!fp",/^(show)?\s*$/,(msg,matchData,who)->
#  log("and here I show my stuff")
#addChatCommand "!fp",/^init\s+(\d+)\s+(\d+)\s*$/, (msg, matchData, who)->
#  [dark,light] = matchData[1..2]
#  d = "here I do some stuff #{dark} #{light}"
#  log d
#  # TODO must do something about output here
#  # things to consider are how to handle the who are we passing around
#  # a single response or an array of responses that we output when done, or are we passing
#  # a stream that each callback should just use
#  # And then of course, how to test that.
#
#
#@processApiChatCommand = (cmd, who)->
#  [api,msg] = cmd.split(" ",2)
#  return false unless apiChatCommands[api]?
#  log api


