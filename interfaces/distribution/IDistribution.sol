pragma solidity 0.5.10;


/// @author The SocialChains.io Team
/// @title An interface which defines the distribution related functionality.
interface IDistribution {
    
    /// NOTICE: Iterations in a loop can grow beyond the block gas limit 
    /// which can cause the complete contract to be stalled at a certain point
    /// so make sure to slice the input argument arrays into smaller chunks if necessary. 
         
    /// Distribute tokens in a flexible fashion 
    /// Versatility between n recipients and k values.
    /// @param _recipients is the addresses of the recipients.
    /// @param _amounts is the values associated with the recipients.
    function flexDistribution(address[] calldata _recipients, uint[] calldata _amounts) external;
    
    
    ///NOTICE: Iterations in a loop can grow beyond the block gas limit 
    ///which can cause the complete contract to be stalled at a certain point
    ///so make sure to slice the input argument arrays into smaller chunks if necessary. 
           
    /// Distribute tokens in a semi restricted fashion 
    /// Versatility between n recipients and a fixed value.    
    /// @param _recipients is the addresses of the recipients.
    /// @param _amount is the value associated with the recipients.
    function multiDistribution(address[] calldata _recipients, uint _amount) external;
    
    
    /// NOTICE: Iterations in a loop can grow beyond the block gas limit 
    /// which can cause the complete contract to be stalled at a certain point
    /// so make sure to slice the input argument arrays into smaller chunks if necessary.  
    
    /// Distribute tokens in a restricted fashion 
    /// Specific recipient with a fixed value.    
    /// @param _recipient is the address of the recipient.
    /// @param _amount is the value associated with the recipient.
    function singleDistribution(address _recipient, uint _amount) external;
    
    
    /// EVM logging of distribution-related activities
    /// @param recipient is the address of the recipient.
    /// @param amount is the value associated with the recipient.
    event Distributed(address recipient, uint amount);
}