module L06.MoreParser where

import L01.Validation
import L05.Parser
import Data.Char
import Numeric
import Control.Applicative
import Control.Monad

-- Parses the given input and returns the result.
-- The remaining input is ignored.
(<.>) ::
  Parser a
  -> Input
  -> Validation a
(<.>) =
  error "todo"

-- Exercise 1
-- Write a parser that will parse zero or more spaces.
spaces ::
  Parser String
spaces =
  error "todo"

-- Exercise 2
-- Write a function that applies the given parser, then parses 0 or more spaces,
-- then produces the result of the original parser.
-- ~~~ Use the monad instance ~~~
tok ::
  Parser a
  -> Parser a
tok =
  error "todo"

-- Exercise 3
-- Write a function that parses the given char followed by 0 or more spaces.
-- ~~~ Use tok and is ~~~
charTok ::
  Char
  -> Parser Char
charTok =
  error "todo"

-- Exercise 4
-- Write a parser that parses a comma ',' followed by 0 or more spaces.
-- ~~~ Use charTok ~~~
commaTok ::
  Parser Char
commaTok =
  error "todo"

-- Exercise 5
-- | Write a parser that parses either a double-quote or a single-quote.
-- ~~~ Use is and (|||) ~~~
--
-- >>> parse quote "'abc"
-- Value ("abc",'\'')
--
-- >>> parse quote "\"abc"
-- Value ("abc",'"')
--
-- >>> isError (parse quote "abc")
-- True
quote ::
  Parser Char
quote =
  error "todo"

-- Exercise 6
-- | Write a function that parses the given string (fails otherwise).
-- ~~~ Use is and mapM ~~~
--
-- >>> parse (string "abc") "abcdef"
-- Value ("def","abc")
--
-- >>> isError (parse (string "abc") "bcdef")
-- True
string ::
  String
  -> Parser String
string =
  error "todo"

-- Exercise 7
-- | Write a function that parsers the given string, followed by 0 or more spaces.
-- ~~~ Use tok and string ~~~
--
-- >>> parse (stringTok "abc") "abc  "
-- Value ("","abc")
--
-- >>> isError (parse (stringTok "abc") "bc  ")
-- True
stringTok ::
  String
  -> Parser String
stringTok =
  error "todo"

-- Exercise 8
-- | Write a function that tries the given parser, otherwise succeeds by producing the given value.
-- ~~~ Use (|||) ~~~
--
-- >>> parse (option 'x' character) "abc"
-- Value ("bc",'a')
--
-- >>> parse (option 'x' character) ""
-- Value ("",'x')
option ::
  a
  -> Parser a
  -> Parser a
option =
  error "todo"

-- Exercise 9
-- | Write a parser that parses 1 or more digits.
-- ~~~ Use many1 and digit ~~~
--
-- >>> parse digits1 "123"
-- Value ("","123")
--
-- >>> isError (parse digits1 "abc123")
-- True
digits1 ::
  Parser String
digits1 =
  error "todo"

-- Exercise 10
-- | Write a function that parses one of the characters in the given string.
-- ~~~ Use satisfy and elem ~~~
--
-- >>> parse (oneof "abc") "bcdef"
-- Value ("cdef",'b')
--
-- >>> isError (parse (oneof "abc") "def")
-- True
oneof ::
  String
  -> Parser Char
oneof =
  error "todo"

-- Exercise 11
-- | Write a function that parses any character, but fails if it is in the given string.
-- ~~~ Use satisfy and notElem ~~~
--
-- >>> parse (noneof "bcd") "abc"
-- Value ("bc",'a')
--
-- >>> isError (parse (noneof "abcd") "abc")
-- True
noneof ::
  String
  -> Parser Char
noneof =
  error "todo"

-- Exercise 12
-- | Write a function that applies the first parser, runs the third parser keeping the result,
-- then runs the second parser and produces the obtained result.
-- ~~~ Use the Monad instance ~~~
--
-- >>> parse (between (is '[') (is ']') character) "[a]"
-- Value ("",'a')
--
-- >>> isError (parse (between (is '[') (is ']') character) "[abc]")
-- True
--
-- >>> isError (parse (between (is '[') (is ']') character) "[abc")
-- True
--
-- >>> isError (parse (between (is '[') (is ']') character) "abc]")
-- True
between ::
  Parser o
  -> Parser c
  -> Parser a
  -> Parser a
between =
  error "todo"

-- Exercise 13
-- | Write a function that applies the given parser in between the two given characters.
-- ~~~ Use between and charTok ~~~
--
-- λ> parse (betweenCharTok '[' ']' character) "[a]"
-- Value ("",'a')
--
-- λ> isError (parse (betweenCharTok '[' ']' character) "[abc]")
-- True
--
-- λ> isError (parse (betweenCharTok '[' ']' character) "[abc")
-- True
--
-- λ> isError (parse (betweenCharTok '[' ']' character) "abc]")
-- True
betweenCharTok ::
  Char
  -> Char
  -> Parser a
  -> Parser a
betweenCharTok =
  error "todo"

-- Exercise 14
-- | Write a function that parses the character 'u' followed by 4 hex digits and return the character value.
-- ~~~ Use readHex, isHexDigit, replicateM, satisfy and the Monad instance ~~~
--
-- >>> parse hex "u0010"
-- Value ("",'\DLE')
--
-- >>> parse hex "u0a1f"
-- Value ("",'\2591')
--
-- >>> isError (parse hex "0010")
-- True
--
-- >>> isError (parse hex "u001")
-- True
--
-- >>> isError (parse hex "u0axf")
-- True
hex ::
  Parser Char
hex =
  error "todo"

-- Exercise 15
-- Write a function that produces a non-empty list of values coming off the given parser (which must succeed at least once),
-- separated by the second given parser.
-- ~~~ Use list and the Monad instance ~~~
sepby1 ::
  Parser a
  -> Parser s
  -> Parser [a]
sepby1 =
  error "todo"

-- Exercise 16
-- Write a function that produces a list of values coming off the given parser,
-- separated by the second given parser.
-- ~~~ Use sepby1 and (|||) ~~~
sepby ::
  Parser a
  -> Parser s
  -> Parser [a]
sepby =
  error "todo"

-- Exercise 17
-- Write a parser that asserts that there is no remaining input.
eof ::
  Parser ()
eof =
  error "todo"

-- Exercise 18
-- Write a parser that produces a characer that satisfies all of the given predicates.
-- ~~~ Use sequence and Data.List.and ~~~
satisfyAll ::
  [Char -> Bool]
  -> Parser Char
satisfyAll =
  error "todo"

-- Exercise 19
-- Write a parser that produces a characer that satisfies any of the given predicates.
-- ~~~ Use sequence and Data.List.or ~~~
satisfyAny ::
  [Char -> Bool]
  -> Parser Char
satisfyAny =
  error "todo"

-- Exercise 20
-- Write a parser that parses between the two given characters, separated by a comma character ','.
-- ~~~ Use betweenCharTok, sepby and charTok ~~~
betweenSepbyComma ::
  Char
  -> Char
  -> Parser a
  -> Parser [a]
betweenSepbyComma =
  error "todo"
