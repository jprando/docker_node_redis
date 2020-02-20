var redis = require('redis')

var subscriber = redis.createClient({ host: 'redis-db' })

subscriber.on('message', function (channel, message) {
  console.log('Message: ' + message + ' on channel: ' + channel + ' is arrive!')
})

subscriber.subscribe('notification')
