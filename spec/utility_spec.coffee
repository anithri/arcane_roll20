describe "Utility.repeat", ->
  Then -> Utility.repeat("AB",4) == "ABABABAB"
  Then -> Utility.repeat("OOPS",0) == ""
  Then -> Utility.repeat("ABC",1) == "ABC"
  Then -> Utility.repeat("o",9) == "ooooooooo"
