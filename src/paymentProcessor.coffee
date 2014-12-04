module.exports = class PaymentProcessor
  constructor: ->

  pay: (request, cb) ->

    # schedule with cb
    # subscribe to another queue for our payment
    # call cb when we got out payment

    cb null, {
      payment_token: 'payment-001',
      status: 'accepted',
      auth_code: 0,
      payment_account: {
        token: '12312312312312312',
      },
      order: {
        id: 'order-0001',
      }
    }