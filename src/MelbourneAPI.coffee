EventService = require './services/eventService'
RequestValidationService = require './services/requestValidationService'
PaymentProcessor = require './paymentProcessor'
IAMService = require './services/iamService'
async = require 'async'
PaymentAccountService = require './services/paymentAccountService'

module.exports = class MelbourneAPI
  constructor: ->
    @eventService = new EventService
    @requestValidationService = new RequestValidationService
    @paymentProcessor = new PaymentProcessor
    @iamService = new IAMService
    @paymentAccountService = new PaymentAccountService

  pay: (request, cb) ->

    @requestValidationService.validatePayRequest request

    @eventService.event (@payRequestReceivedEvent request)

    # authenticate a merchant
    @iamService.authenticateMerchant request.merchant, (error, result) ->

      # tokenize payment account
      token = @paymentAccountService.tokenize request.payment_account
      request.payment_account = {'token': token}

      @paymentProcessor.pay request, (error, result) ->
#      @eventService.event (@paymentProcessedEvent result)
        cb error, result


  payRequestReceivedEvent: (request) ->
    {
      type: 'pay-request-received',
      merchant_id: request.merchant.id
    }

  paymentProcessedEvent: (result) ->
    {
      type: 'pay-processed',
    }