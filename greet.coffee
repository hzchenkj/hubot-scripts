# Description:
# 	Greet To Master
# Commands:
# 	hubot greet - Greet To Master
module.exports = (robot) ->
   robot.hear /greet/i, (res) ->
     res.send "Hello,My Master"

