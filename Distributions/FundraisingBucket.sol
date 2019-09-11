pragma solidity 0.5.10;


import "INSERT-PATH-TO/SafeMath.sol";
import "INSERT-PATH-TO/Token.sol";
import "INSERT-PATH-TO/IDistribution.sol";

/// @author The SocialChains.io Team
/// @title A flexible approach to token distribution from a manually allocated fundraising bucket.
contract FundraisingBucket is IDistribution {
    using SafeMath for uint;
                
    Token public SONAToken;
    
    address public constant ACCOUNT_OF_FUNDRAISING = //INSERT ACCOUNT ADDRESS OF FUNDRAISING;
    
    uint private constant DECIMALFACTOR = 10 ** uint(DECIMALS);
    uint private constant DECIMALS = 18;
     
    constructor(address _SONAToken) public {
        SONAToken = Token(_SONAToken);
    }
  
 
    function flexDistribution(address[] calldata _recipients, uint[] calldata _amounts) external {
        require(msg.sender == ACCOUNT_OF_FUNDRAISING, "[!] The transaction call was initiated by the wrong account");
        for (uint i = 0; i < _recipients.length; i++) {
            SONAToken.transfer(_recipients[i], _amounts[i].mul(uint256(DECIMALFACTOR)));
            emit Distributed(_recipients[i], _amounts[i]);
        }
    }  


    function multiDistribution(address[] calldata _recipients, uint _amount) external {
        require(msg.sender == ACCOUNT_OF_FUNDRAISING, "[!] The transaction call was initiated by the wrong account");
        for (uint i = 0; i < _recipients.length; i++) {  
            SONAToken.transfer(_recipients[i], _amount.mul(uint256(DECIMALFACTOR)));            
            emit Distributed(_recipients[i], _amount);
        }
    }  
    

    function singleDistribution(address _recipient, uint _amount) external {
        require(msg.sender == ACCOUNT_OF_FUNDRAISING, "[!] The transaction call was initiated by the wrong account");        
        SONAToken.transfer(_recipient, _amount.mul(uint256(DECIMALFACTOR)));
        emit Distributed(_recipient, _amount);
    }  
    
    
    function getDistributionContractBalance() public view returns (uint) {
        return (SONAToken.balanceOf(address(this)));
    }

}
