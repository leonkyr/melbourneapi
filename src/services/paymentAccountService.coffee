module.exports = class PaymentAccountService
  constuctor: ->

  tokenize: (account) ->
    '13123123123'

  getByToken: (token) ->
    {
      type: 'card'
    }

