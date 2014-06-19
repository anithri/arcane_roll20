#
#  Utility is a collection of useful functions
#
# Utility.repeat(str,count) returns the string str repeated count times.
# Utility.repeat("[ ]",3) = "[ ][ ][ ]"
#

@Utility = {
  repeat: (str, count)->
    return '' if count < 1
    result = ''
    pattern = str
    while count > 1
      result += pattern if (count & 1)
      count >>=1
      pattern += pattern
    return result + pattern;
}

