AWS = require('aws-sdk');

module.exports = class EventService
  constructor: () ->
    AWS.config.region = 'eu-central-1';

  event: (event)->

    # Send event to a log
    params = {
      Data: new Buffer(JSON.stringify(event)).toString('base64'), #/* required */
      PartitionKey: 'events', #/* required */
      StreamName: 'sequre-event-stream' #/* required */
    }

    kinesis = new AWS.Kinesis()

    kinesis.putRecord params, (err, data) ->
      if (err)
        console.log(err, err.stack); # an error occurred
      else
        console.log(data);           # successful response
