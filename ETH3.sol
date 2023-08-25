// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}

contract ERC20 is IERC20 {
    address public immutable owner;
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute this function");
        _;
    }

    string public constant name = "Diya";
    string public constant symbol = "DA";
    uint8 public constant decimals = 18; // Corrected to 18, which is the standard value

    function transfer(address recipient, uint amount) external override returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance");
        
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    
    function approve(address spender, uint amount) external override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    
    function transferFrom(address sender, address recipient, uint amount) external override returns (bool) {
        require(balanceOf[sender] >= amount, "Insufficient Balance");
        require(allowance[sender][msg.sender] >= amount, "Transfer amount exceeds allowance");
        
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        allowance[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }
    
    function mint(uint amount) external onlyOwner {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }
    
    function burn(uint amount) external {
        require(amount > 0, "Amount should not be zero");
        require(balanceOf[msg.sender] >= amount, "Insufficient Balance");
        
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
    }
}
