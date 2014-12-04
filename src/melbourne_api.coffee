
module.exports = class MelbourneAPI

  pay: (request, cb) ->

    cb new Error('Empty request') unless request

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