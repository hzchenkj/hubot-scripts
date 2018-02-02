module.exports = (robot) ->
  robot.router.get "/foo", (req, res) ->
    res.end "bar"
