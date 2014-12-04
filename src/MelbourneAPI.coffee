EventService = require './services/eventService'
RequestValidationService = require './services/requestValidationService'
PaymentProcessor = require './paymentProcessor'

module.exports = class MelbourneAPI
  constructor: ->
    @eventService = new EventService()
    @requestValidationService = new RequestValidationService()
    @paymentProcessor = new PaymentProcessor()

  pay: (request, cb) ->

    @requestValidationService.validatePayRequest request

    @eventService.event (@payRequestReceivedEvent request)

    # authenticate a merchant
    # tokenize payment account
    # queue payment for processing without payment account
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