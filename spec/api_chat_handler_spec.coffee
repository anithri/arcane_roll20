describe "ApiChatResponder", ->
  acc = null
  describe "constructor", ->
    it "assigns args correctly", ->
      acc = new ApiChatResponder(123,"abc")
      expect(acc.regExp).toEqual(123)
      expect(acc.respondWith).toEqual("abc")

describe "ApiChatModule", ->
  acc = null
  describe "constructor", ->
    it "assigns args correctly", ->
      acm = new ApiChatModule("foo")
      expect(acm.name).toEqual("foo")
      expect(acm.responders).toEqual([])

  describe "addResponder", ->
    it "adds the newResponder to the responders array", ->
      acm = new ApiChatModule("bar")
      acm.addResponder(123)
      expect(acm.responders).toEqual([123])

  describe "addChatCommand", ->
    it "constructs a ApiChatResponder object and calls addResponder with it", ->
      acm = new ApiChatModule("bar")
      acm.addChatCommand(123, 'abc')
      expect(acm.responders[0].regExp).toEqual(123)
      expect(acm.responders[0].respondWith).toEqual('abc')

describe "ApiChatHandler", ->
  ach = null

  describe "has default values", ->
    ach = new ApiChatHandler
    Then -> expect(ach.apiHandlers).toEqual({})

  describe ".addChatModule", ->
    it "adds entries for new module", ->
      ach = new ApiChatHandler
      fake_module = {name: "foo"}
      ach.addChatModule(fake_module)
      expect(ach.apiHandlers.foo).toEqual(fake_module)
