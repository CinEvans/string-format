format = String::format = (args...) ->

  if args.length is 0
    return (args...) => @format args...

  idx = 0
  explicit = implicit = no
  message = 'cannot switch from {} to {} numbering'.format()

  # TODO: match integers correctly
  format_spec = ///^
    (?:
      ([^{}])?              # fill
      ([<>=^])              # align
    )?
    ([-+\x20])?             # sign
    (\#)?                   # "#"
    (0)?                    # "0"
    (\d+)?                  # width
    (,)?                    # ","
    (?:
      [.]                   # "."
      (\d+)                 # precision
    )?
    ([bcdeEfFgGnosxX%])?    # type
  $///

  @replace \
  /([{}])\1|[{](.*?)(?:!(.+?))?[}]/g,
  (match, literal, key, transformer) ->
    if literal
      literal
    else if key.charAt(0) is ':'
      [fill, align, sign, octothorp, zero, width, comma, precision, type] =
        format_spec.exec(key.substr ':'.length)[1..]

      # defaults
      sign      ?= '-'
      precision ?= '6'

      switch type
        when 'f'
          # TODO: decide how to handle wrong number of args and other
          # causes of failed lookups
          explicit = yes # TODO: work out whether this is the case
          num = Number args[idx++]
          "#{if 1 / num < 0 or sign is '-' then '' else sign}#{num.toFixed precision}"
    else
      if key.length
        explicit = yes
        throw new Error message 'implicit', 'explicit' if implicit
        value = lookup(args, key) ? ''
      else
        implicit = yes
        throw new Error message 'explicit', 'implicit' if explicit
        value = args[idx++] ? ''

      value = value.toString()
      if fn = format.transformers[transformer] then fn.call(value) ? ''
      else value

lookup = (object, key) ->
  unless /^(\d+)([.]|$)/.test key
    key = '0.' + key
  while match = /(.+?)[.](.+)/.exec key
    object = resolve object, match[1]
    key = match[2]
  resolve object, key

resolve = (object, key) ->
  value = object[key]
  if typeof value is 'function' then value.call object else value

format.transformers = {}

format.version = '0.2.1'
