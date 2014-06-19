describe "ForcePoolObject", ->
  fp = null
  beforeEach ->
    fp = new ForcePoolObject(2,4)

  describe ".constructor", ->
    it "should set darkside and lightside points", ->
      expect(fp.darkSidePoints).toEqual(2)
      expect(fp.lightSidePoints).toEqual(4)

  describe "has default values", ->
    Then -> fp.strDark  == "0"
    Then -> fp.strLight == "+"


  describe ".useLight", ->
    it "should decrement lightSide and increment darkSide", ->
      fp = new ForcePoolObject(0,2)
      fp.useLight()
      expect(fp.darkSidePoints).toEqual(1)
      expect(fp.lightSidePoints).toEqual(1)
      fp.useLight()
      expect(fp.darkSidePoints).toEqual(2)
      expect(fp.lightSidePoints).toEqual(0)

    it "... unless there are no lightside points", ->
      fp = new ForcePoolObject(0,0)
      fp.useLight()
      expect(fp.darkSidePoints).toEqual(0)
      expect(fp.lightSidePoints).toEqual(0)

  describe ".useDark", ->
    it "should decrement darkSide and increment lightSide", ->
      fp = new ForcePoolObject(2,0)
      fp.useDark()
      expect(fp.darkSidePoints).toEqual(1)
      expect(fp.lightSidePoints).toEqual(1)
      fp.useDark()
      expect(fp.darkSidePoints).toEqual(0)
      expect(fp.lightSidePoints).toEqual(2)

    it "... unless there are no darkSide points", ->
      fp = new ForcePoolObject(0,0)
      fp.useDark()
      expect(fp.darkSidePoints).toEqual(0)
      expect(fp.lightSidePoints).toEqual(0)

  describe ".showData", ->
    it "should echo dark and light side points", ->
      expect(fp.showData()).toEqual("00++++")
