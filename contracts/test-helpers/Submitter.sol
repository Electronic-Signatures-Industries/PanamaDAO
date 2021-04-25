// helper for testing daoCoop.submitProposal return value

pragma solidity 0.5.3;

import "../DAOCoop.sol";

contract Submitter {

  event Submit(uint256 proposalId);

  DAOCoop public daoCoop; // daoCoop contract reference

  constructor(address molochAddress) public {
    daoCoop = DAOCoop(molochAddress);
  }

  function submitProposal(
    address applicant,
    uint256 sharesRequested,
    uint256 lootRequested,
    uint256 tributeOffered,
    address tributeToken,
    uint256 paymentRequested,
    address paymentToken,
    string memory details
  ) public {
    uint256 proposalId = daoCoop.submitProposal(
      applicant,
      sharesRequested,
      lootRequested,
      tributeOffered,
      tributeToken,
      paymentRequested,
      paymentToken,
      details
    );

    emit Submit(proposalId);
  }

  function submitWhitelistProposal(
    address tokenToWhitelist,
    string memory details
  ) public {
    uint256 proposalId = daoCoop.submitWhitelistProposal(
      tokenToWhitelist,
      details
    );

    emit Submit(proposalId);
  }

  function submitGuildKickProposal(
    address memberToKick,
    string memory details
  ) public {
    uint256 proposalId = daoCoop.submitGuildKickProposal(
      memberToKick,
      details
    );

    emit Submit(proposalId);
  }
}
