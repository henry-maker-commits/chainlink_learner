pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PriceConsumerV3Update is Ownable {
	mapping(address => AggregatorV3Interface) internal priceFeedMap;

	function setPriceFeed(address token, address priceFeed) external onlyOwner{
		priceFeedMap[token] = AggregatorV3Interface(priceFeed);
	}


	function getLatesPrice(address token) public view returns (int) {
		(uint80 roundID,
		int price,
		uint startedAt,
		uint timeStamp,
		uint80 answeredInRound) = priceFeedMap[token].latestRoundData();
		return price;
	}
}
