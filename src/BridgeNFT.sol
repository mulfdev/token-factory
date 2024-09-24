// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract BridgeNFT is ERC721, ERC721URIStorage, Ownable {
    using Strings for uint256;

    uint256 private _nextTokenId = 1;
    string private constant BASE_TOKEN_URI = "https://media.mulf.wtf/nftmedia/";

    constructor(
        address initialOwner
    ) ERC721("BridgeNFT", "BFT") Ownable(initialOwner) {}

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;

        require(tokenId <= 5, "Only 5 tokens allowed");

        _safeMint(to, tokenId);

        string memory _tokenURI = string(
            abi.encodePacked(BASE_TOKEN_URI, tokenId.toString(), ".json")
        );
        _setTokenURI(tokenId, _tokenURI);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
