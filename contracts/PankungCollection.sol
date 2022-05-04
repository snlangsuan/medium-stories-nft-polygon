// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PankungCollection is ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721("PankungCollection", "PKC") {}

  function totalSupply() public view returns (uint256) {
    return _tokenIds.current();
  }

  function mintItem(address to, string memory tokenURI) public onlyOwner returns (uint256) {
    uint256 newItemId = _tokenIds.current();
    _safeMint(to, newItemId);
    _setTokenURI(newItemId, tokenURI);
    _tokenIds.increment();
    return newItemId;
  }
}
