
@ForcePoolObject = (@darkSidePoints,@lightSidePoints)->
  #noop

ForcePoolObject.prototype = {
  strDark: "0"
  strLight: "+"
  showData: ->
    Utility.repeat(@strDark, @darkSidePoints) + Utility.repeat(@strLight, @lightSidePoints)
  useLight: (who = "TK421")->
    return unless @lightSidePoints > 0
    @lightSidePoints -= 1
    @darkSidePoints += 1
  useDark: (who = "TK421")->
    return unless @darkSidePoints > 0
    @lightSidePoints += 1
    @darkSidePoints -= 1
}
@ForcePool ?= null

fpModule = new ApiChatModule("!fp")
fpModule.addChatCommand /^init\s+(\d+)\s+(\d+)\s+$/i, (msg, matchData, who)->
  [dsp,lsp] =  matchData[1..2]
  @ForcePool = new ForcePoolObject dsp,lsp
  # TODO Need some output here

fpModule.addChatCommand /^\s*(show)?\s*$/, (msg, matchData, who)->
  @ForcePool.showData
  #output it somehow

# TODO include before and after useLight and useDark callback infrastructure
