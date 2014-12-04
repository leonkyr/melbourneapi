module.exports = class IAMService
  constructor: ->

  authenticateMerchant: (merchant, cb) ->
    cb new Error('Invalid input'), null unless merchant

    # auth

