var redis = require('redis')

var subscriber = redis.createClient({ host: 'redis-db' })

subscriber.on('message', function (channel, message) {
  console.log(`[ ${new Date().toISOString()} ] Message: ` + message + ' on channel: ' + channel)
})

subscriber.subscribe('notification')
