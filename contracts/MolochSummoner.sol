pragma solidity 0.8.0;

import "./DAOCoop.sol";

contract DAOCoopSummoner {

    DAOCoop private M;

    address[] public DAOCoops;

    event Summoned(address indexed M, address indexed _summoner);

    function summonDAOCoop(
        address _summoner,
        address[] memory _approvedTokens,
        bytes memory _actaUri, // Acta
        bytes memory _bylawUri, // Estatuto
        bool _hasKyb, // Certificacion de entidad financiera
        bool _hasIpacoopCertify, // Estudio de viabilidad economica social      
        uint256 _periodDuration,
        uint256 _votingPeriodLength,
        uint256 _gracePeriodLength,
        uint256 _proposalDeposit,
        uint256 _dilutionBound,
        uint256 _processingReward) public {

        M = new DAOCoop(
            _summoner,
            _approvedTokens,
            _actaUri,
            _bylawUri,
            _hasKyb,
            _hasIpacoopCertify,
            _periodDuration,
            _votingPeriodLength,
            _gracePeriodLength,
            _proposalDeposit,
            _dilutionBound,
            _processingReward);

        DAOCoops.push(address(M));

        emit Summoned(address(M), _summoner);

    }

    function getDAOCoopCount() public view returns (uint256 DAOCoopCount) {
        return DAOCoops.length;
    }
}
