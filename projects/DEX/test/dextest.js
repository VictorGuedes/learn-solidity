// The user must have ETH deposited such that deposited eth >= buy order value

// The user must have enougth tokens deposited such that token balance >= sell order amount

// The BUY order book should be ordered on price from highest to lowest starting at index 0

const Dex = artifacts.require("Dex")
const Link = artifacts.require("Link")
const truffleAssert = require('truffle-assertions')

contract("Dex", accounts => {
    let dex = await Dex.deployed()
    let link = await Link.deployed()


})