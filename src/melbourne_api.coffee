EventService = require './services/eventService'
RequestValidationService = require './services/requestValidationService'

module.exports = class MelbourneAPI
  constructor: () ->
    @eventService = new EventService()
    @requestValidationService = new RequestValidationService()

  pay: (request, cb) ->

    @requestValidationService.validatePayRequest request

    @eventService.event (@payRequestReceivedEvent request)

    # authenticate a merchant
    # tokenize payment account
    # queue payment for processing without payment account
    # when our payment is processed - execute cb

    @eventService.event (@paymentProcessedEvent request)

    cb null, {
      melbourne_payment_token: 'payment-001',
      status: 'accepted',
      auth_code: 0,
      payment_account: {
        token: '12312312312312312',
      },
      order: {
        id: 'order-0001',
      }
    }

  payRequestReceivedEvent: (request) ->
    {
      type: 'pay-request-received',
      merchant_id: request.merchant.id
    }

  paymentProcessedEvent: (request) ->
    {
      type: 'pay-processed',
      merchant_id: request.merchant.id
    }