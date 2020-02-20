var redis = require('redis')

var publisher = redis.createClient({ host: 'redis-db' })

setInterval(() => {
  console.log(`[ ${new Date().toISOString()} ] pub msg...`)
  publisher.publish('notification', '{”message”:”Hello world from Asgardian!”}')
}, 1000)
