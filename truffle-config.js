const HDWalletProvider = require('@truffle/hdwallet-provider')
require('dotenv').config()

const privateKey = process.env.METAMASK_PRIVATEKEY
const alchemyApiKey = process.env.ALCHEMY_API_KEY

module.exports = {

  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*",
    },
    polygon_alchemy_testnet: {
      provider: () => new HDWalletProvider(privateKey, 'https://polygon-mumbai.g.alchemy.com/v2/' + alchemyApiKey),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      chainId: 80001
    }
  },
  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.13",
    }
  },
};
