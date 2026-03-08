import strutils

proc hey*(s: string): string =

  let isQuestion = s.strip.endsWith('?')
  let isUpperCase = s.toUpperAscii == s and s.contains(Letters)

  if s.strip() == "":
    return "Fine. Be that way!"

  if isQuestion and isUpperCase:
    return "Calm down, I know what I\'m doing!"

  if isUpperCase:
    return "Whoa, chill out!"

  if isQuestion:
    return "Sure."

  return "Whatever."
