const getBinance = () => {

  const { Spot } = require('@binance/connector')

  const apiKey = 'UWQQv1qTI5XQ4Dxn6SXP9eoE559o0tUBQ6GsNdURD6Hc1pef1hzCldxwwRQ4hhAL'
  const apiSecret = 'oxrUANTILzmSjbxvptCsi3appQlzS6iv7HHnd7JOC6sJBvUJXACsJHvbOBUzSc5X'
  const client = new Spot(apiKey, apiSecret)

  client.accountSnapshot('SPOT')
    .then(response => client.logger.log(response.data))
    .catch(error => client.logger.error(error))

}

export { getBinance }
