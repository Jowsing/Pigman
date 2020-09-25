pragma solidity >=0.4.23 <0.6.0;

contract Dividends {
    address private admin;
    address[] private members;
    uint[] private scales;
    uint private scalesSum;

    constructor(address[] memory members_, uint[] memory scales_) public {
        require(members_.length > 0 && members_.length == scales_.length, "Dividend ratio does not correspond to");
        uint _scalesSum = 0;
        for(uint i = 0; i < scales_.length; i++) {
            _scalesSum += scales_[i];
        }
        require(_scalesSum != 0, "The sum of dividend ratios cannot be zero");
        admin = msg.sender;
        members = members_;
        scales = scales_;
        scalesSum = _scalesSum;
    }

    function withdraw() external {
        require(msg.sender == admin, 'only admin can withdraw');
        uint balance = uint(address(this).balance);
        for (uint i = 0; i < members.length; i++) {
            uint amount = balance * scales[i] / scalesSum;
            address(uint160(members[i])).transfer(amount);
        }
    }

    function () external payable {

    }
}
