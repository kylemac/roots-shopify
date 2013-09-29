jade = require("jade")
liquid = require("tinyliquid")

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
  catch err
    error = err

  # TODO: Utilize tinyliquid to verify liquid templates have compiled w/o error
  cb error, compiled