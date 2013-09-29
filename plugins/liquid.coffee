jade = require("jade")
liquid = require("tinyliquid")
locals = require("./locals.json")

exports.settings =
  file_type: "jade"
  target: "liquid"

exports.compile = (file, cb) ->
  error = undefined
  compiled = undefined
  try
    compiled = jade.compile(file.contents,
      pretty: not global.options.compress
      filename: file.path
    )
    
    # Verify Liquid Templating
    # ========================
    # html = compiled(file.contents)
    # render = liquid.compile(html)
    # context = liquid.newContext(locals: {})
    # render context, (err) ->
    #   console.log err
    #   console.log context.getBuffer()

  catch err
    error = err

  # console.log locals 
  cb error, compiled