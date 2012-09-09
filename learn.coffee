# Description:
#   Register new responses on the fly.
#   This is all sorts of ugly atm -- just playing around.
#
# Commands:
#   hubot learn respond <regex> reply <query>
#   hubot learn hear <regex> reply <query>

learnRegex = (regex_str) ->
   RegExp(regex_str, "i") 

findRegex = (msg) -> msg.match[1]
findResp  = (msg) -> msg.match[2]

module.exports = (robot) ->

  robot.respond /learn respond (.+) reply (.+)/i, (msg) ->
    regex = findRegex(msg)
    resp  = findResp(msg)

    msg.send "Learning to respond to " + regex
    robot.respond learnRegex(regex), (msg) ->
      msg.send resp

  robot.respond /learn hear (.+) reply (.+)/i, (msg) ->
    regex = findRegex(msg)
    resp  = findResp(msg)

    msg.send "Learning to hear " + regex
    robot.hear learnRegex(regex), (msg) ->
      msg.send resp

