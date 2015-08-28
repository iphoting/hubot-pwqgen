# Description
#   Fetches a randomly generated passphrase from https://pwqgen.herokuapp.com/
#
# Configuration:
#   HUBOT_PWQGEN_URL
#
# Commands:
#   hubot pwqgen - Returns a randomly generated passphrase
#
# Notes:
#   None
#
# Author:
#   iphoting

process.env.HUBOT_PWQGEN_URL ||= 'https://pwqgen.herokuapp.com/txt'

module.exports = (robot) ->
  robot.respond /pwqgen/i, (res) ->
    res.http(process.env.HUBOT_PWQGEN_URL).get() (err, code, body) ->
        try
          res.reply body
        catch e
          res.reply "Unable to generate a randome passphrase."
