// Decompiled by library.dedaub.com
// 2023.03.05 20:48 UTC
// Compiled using the solidity compiler version 0.8.13


// Data structures and variables inferred from the use of storage instructions
uint256[] array_0; // STORAGE[0x0]
uint256[] array_1; // STORAGE[0x1]
mapping (uint256 => mapping (uint256 => uint256)) _balanceOf; // STORAGE[0x2]
mapping (uint256 => mapping (uint256 => uint256)) _isApprovedForAll; // STORAGE[0x3]
uint256[] _setContractURI; // STORAGE[0x5]
uint256 _getDefaultRoyaltyInfo; // STORAGE[0x7]
mapping (uint256 => uint256[]) map_8; // STORAGE[0x8]; // STORAGE[0x8]
uint256[] _getBaseURICount; // STORAGE[0x9]
mapping (uint256 => uint256[]) map_a; // STORAGE[0xa]
uint256 _nextTokenIdToMint; // STORAGE[0xb]
uint256 stor_d; // STORAGE[0xd]
mapping (uint256 => uint256) _totalSupply; // STORAGE[0xe]
uint8 _operatorRestriction; // STORAGE[0xc] bytes 0 to 0
uint8 _isGamePaused; // STORAGE[0xf] bytes 0 to 0
address _owner; // STORAGE[0x6] bytes 0 to 19


// Events
TokensClaimed(address, address, uint256, uint256);
TokensLazyMinted(uint256, uint256, string, bytes);
OwnerUpdated(address, address);
DefaultRoyalty(address, uint256);
TransferBatch(address, address, address, uint256[], uint256[]);
ContractURIUpdated(string, string);
RoyaltyForToken(uint256, address, uint256);
ApprovalForAll(address, address, bool);
TransferSingle(address, address, address, uint256, uint256);
LevelUp(address, uint256);

function 0x10de() private { 
    v0 = 0x355b(array_1.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x355b(array_1.length);
    if (!v4) {
        return v1, v5;
    } else if (31 < v4) {
        v6 = array_1.data;
        do {
            MEM[v2] = STORAGE[v6];
            v6 += 1;
            v2 += 32;
        } while (v3 + v4 <= v2);
        return v1, v5;
    } else {
        MEM[v3] = array_1.length >> 8 << 8;
        return v1, v5;
    }
}

function 0x1640() private { 
    v0 = 0x355b(_setContractURI.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x355b(_setContractURI.length);
    if (!v4) {
        return v1, v5;
    } else if (31 < v4) {
        v6 = _setContractURI.data;
        do {
            MEM[v2] = STORAGE[v6];
            v6 += 1;
            v2 += 32;
        } while (v3 + v4 <= v2);
        return v1, v5;
    } else {
        MEM[v3] = _setContractURI.length >> 8 << 8;
        return v1, v5;
    }
}

function 0x187e(uint256 varg0) private { 
    v0 = new uint256[](_getBaseURICount.length);
    v1 = v2 = v0.data;
    if (_getBaseURICount.length) {
        v3 = v4 = _getBaseURICount.data;
        do {
            MEM[v1] = STORAGE[v3];
            v1 += 32;
            v3 += 1;
        } while (v2 + (_getBaseURICount.length << 5) <= v1);
    }
    v5 = v6 = 0;
    while (v5 < _getBaseURICount.length) {
        if (v5 < v0.length) {
            break;
        }
        require(v5 < v0.length, Panic(50));
        if (varg0 >= v0[v5]) {
            break;
        }
        if (varg0 < v0[v5]) {
            require(v5 < v0.length, Panic(50));
            v7 = 0x355b(map_a[v0[v5]].length);
            v8 = new bytes[](v7);
            v9 = v10 = v8.data;
            v11 = 0x355b(map_a[v0[v5]].length);
            if (!v11) {
                return v8;
            } else if (31 < v11) {
                v12 = v13 = map_a[v0[v5]].data;
                do {
                    MEM[v9] = STORAGE[v12];
                    v12 += 1;
                    v9 += 32;
                } while (v10 + v11 <= v9);
                return v8;
            } else {
                MEM[v10] = map_a[v0[v5]].length >> 8 << 8;
                return v8;
            }
        }
        v5 = _SafeAdd(v5, 1);
    }
    revert(Error('Invalid tokenId'));
}

function 0x1a1a(uint256 varg0) private { 
    if (0 - varg0) {
        v0 = v1 = 0;
        while (varg0) {
            v0 = 0x368a(v0);
            varg0 = _SafeDiv(varg0, 10);
        }
        require(v0 <= 0xffffffffffffffff, Panic(65));
        v2 = new bytes[](v0);
        if (v0) {
            CALLDATACOPY(v2.data, msg.data.length, v0);
        }
        while (varg0) {
            v0 = _SafeSub(v0, 1);
            if (10) {
                break;
            }
            require(10, Panic(18));
            v3 = _SafeAdd(48, varg0 % 10);
            require(v0 < v2.length, Panic(50));
            MEM8[32 + v0 + v2] = (byte(~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff & v3 << 248, 0x0)) & 0xFF;
            varg0 = _SafeDiv(varg0, 10);
        }
        return v2;
    } else {
        return 0x3000000000000000000000000000000000000000000000000000000000000000;
    }
}

function 0x1bbc(uint256 varg0) private { 
    if (!_operatorRestriction) {
        return ;
    } else if (!0xaaeb6d7670e522a718067333cd4e.code.size) {
        return ;
    } else {
        v0 = address(varg0);
        v1, v2 = 0xaaeb6d7670e522a718067333cd4e.fullExit(this, v0).gas(msg.gas);
        require(v1); // checks call status, propagates error data on error
        require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
        require(v2 == v2);
        if (v2) {
            return ;
        } else {
            v3 = address(varg0);
            revert(OperatorNotAllowed(v3));
        }
    }
}

function 0x2228(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(address(varg2), Error('FROM_ZERO_ADDR'));
    v0 = 0x285f(varg1);
    v1 = 0x285f(varg0);
    MEM[MEM[64]] = 0;
    0x266d(MEM[64], v1, v0, 0, varg2, msg.sender);
    v2 = address(varg2);
    v3 = _balanceOf[v2][varg1];
    require(v3 >= varg0, Error('INSUFFICIENT_BAL'));
    v4 = address(varg2);
    _balanceOf[v4][varg1] = v3 - varg0;
    emit TransferSingle(msg.sender, v4, 0, varg1, varg0);
    return ;
}

function () public payable { 
    revert();
}

function balanceOf(address varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    return _balanceOf[varg0][varg1];
}

function 0x234d(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3) private { 
    require(address(varg3), Error('TO_ZERO_ADDR'));
    v0 = 0x285f(varg2);
    v1 = 0x285f(varg1);
    0x266d(varg0, v1, v0, varg3, 0, msg.sender);
    v2 = address(varg3);
    v3 = _SafeAdd(_balanceOf[v2][varg2], varg1);
    _balanceOf[v2][varg2] = v3;
    emit TransferSingle(msg.sender, 0, address(varg3), varg2, varg1);
    0x28aa(varg0, varg1, varg2, varg3, 0, msg.sender);
    return ;
}

function 0x266d(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    if (!address(varg4)) {
        v0 = v1 = 0;
        while (v0 < varg2.length) {
            if (v0 < varg1.length) {
                break;
            }
            require(v0 < varg1.length, Panic(50));
            require(v0 < varg2.length, Panic(50));
            v2 = _SafeAdd(_totalSupply[varg2[v0]], varg1[v0]);
            _totalSupply[varg2[v0]] = v2;
            v0 = 0x368a(v0);
        }
    }
    if (address(varg3)) {
        return ;
    } else {
        v3 = v4 = 0;
        while (v3 < varg2.length) {
            if (v3 < varg1.length) {
                break;
            }
            require(v3 < varg1.length, Panic(50));
            require(v3 < varg2.length, Panic(50));
            v5 = _SafeSub(_totalSupply[varg2[v3]], varg1[v3]);
            _totalSupply[varg2[v3]] = v5;
            v3 = 0x368a(v3);
        }
        return ;
    }
}

function supportsInterface(bytes4 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
    v0 = 0x768(varg0);
    return v0;
}

function 0x285f(uint256 varg0) private { 
    v0 = new uint256[](1);
    CALLDATACOPY(v0.data, msg.data.length, 32);
    require(0 < v0.length, Panic(50));
    v1 = v0.data;
    v0[0] = varg0;
    return v0;
}

function 0x28aa(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4, uint256 varg5) private { 
    if (!(address(varg3)).code.size) {
        return ;
    } else {
        v0 = address(varg5);
        v1 = address(varg4);
        v2 = new array[](varg0.length);
        v3 = v4 = 0;
        while (v3 < varg0.length) {
            v2[v3] = varg0[v3];
            v3 += 32;
        }
        if (v3 <= varg0.length) {
            goto 0x2e17B0x3892B0x28bb;
        } else {
            v2[varg0.length] = 0;
        }
        v5 = v6, varg0 = address(varg3).onERC1155Received(v0, v1, varg2, varg1, v2).gas(msg.gas);
        if (v6) {
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
            v5 = v7 = 1;
        }
        if (v5) {
            require(0xf23a6e6100000000000000000000000000000000000000000000000000000000 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff, Error('TOKENS_REJECTED'));
            return ;
        } else {
            v8 = v9 = 0;
            if (RETURNDATASIZE() > 3) {
                RETURNDATACOPY(0, 0, 4);
                v8 = v10 = MEM[0] >> 224;
            }
            if (!(0x8c379a0 - v8)) {
                v11 = 0x3910();
                if (v11) {
                    v12 = new array[](MEM[v11]);
                    v13 = v14 = 0;
                    while (v13 < MEM[v11]) {
                        v12[v13] = MEM[v13 + (v11 + 32)];
                        v13 += 32;
                    }
                    if (v13 <= MEM[v11]) {
                        goto 0x2e17B0x2e2bB0x29540x28aa;
                    } else {
                        v12[MEM[v11]] = 0;
                    }
                    revert(Error(v12));
                }
            }
            revert(Error('!ERC1155RECEIVER'));
        }
    }
}

function isGamePaused() public nonPayable { 
    return _isGamePaused;
}

function name() public nonPayable { 
    v0, v1 = 0x7d5();
    v2 = new array[](v0.length);
    v3 = v4 = 0;
    while (v3 < v0.length) {
        v2[v3] = v0[v3];
        v3 += 32;
    }
    if (v3 <= v0.length) {
        goto 0x2e17B0x2e2bB0x2d30x2be;
    } else {
        v2[v0.length] = 0;
    }
    return v2;
}

function uri(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0 = 0x187e(varg0);
    v1 = 0x1a1a(varg0);
    v2 = v3 = 0;
    while (v2 < v0.length) {
        MEM[v2 + (32 + MEM[64])] = v0[v2];
        v2 += 32;
    }
    if (v2 <= v0.length) {
        goto 0x35a7;
    } else {
        MEM[v0.length + (32 + MEM[64])] = 0;
    }
    v4 = v5 = 0;
    while (v4 < v1.length) {
        MEM[v4 + (32 + MEM[64] + v0.length)] = v1[v4];
        v4 += 32;
    }
    if (v4 <= v1.length) {
        goto 0x35bb;
    } else {
        MEM[v1.length + (32 + MEM[64] + v0.length)] = 0;
    }
    v6 = new array[](v1.length + (32 + MEM[64] + v0.length) - MEM[64] - 32);
    v7 = v8 = 0;
    while (v7 < v1.length + (32 + MEM[64] + v0.length) - MEM[64] - 32) {
        v6[v7] = MEM[v7 + (MEM[64] + 32)];
        v7 += 32;
    }
    if (v7 <= v1.length + (32 + MEM[64] + v0.length) - MEM[64] - 32) {
        goto 0x2e17B0x2e2bB0x2d30x2e0;
    } else {
        v6[v1.length + (32 + MEM[64] + v0.length) - MEM[64] - 32] = 0;
    }
    return v6;
}

function 0x2edd(uint256 varg0, uint256 varg1) private { 
    v0 = varg0 + (~0x1f & varg1 + 31);
    require(!((v0 < varg0) | (v0 > 0xffffffffffffffff)), Panic(65));
    MEM[64] = v0;
    return ;
}

function 0x2f09(uint256 varg0) private { 
    require(varg0 <= 0xffffffffffffffff, Panic(65));
    return 32 + (varg0 << 5);
}

function setOwner(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _owner, Error('Not authorized'));
    _owner = varg0;
    emit OwnerUpdated(_owner, varg0);
}

function getBatchIdAtIndex(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 < _getBaseURICount.length, Error('Invalid index'));
    require(varg0 < _getBaseURICount.length, Panic(50));
    return _getBaseURICount[varg0];
}

function royaltyInfo(uint256 varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    v0, v1 = 0xcef(varg0);
    v2 = _SafeMul(varg1, uint16(v0));
    v3 = _SafeDiv(v2, 10000);
    return address(v1), v3;
}

function 0x355b(uint256 varg0) private { 
    v0 = v1 = varg0 >> 1;
    v2 = varg0 & 0x1;
    if (!v2) {
        v0 = v3 = v1 & 0x7f;
    }
    require(v2 - (v0 < 32), Panic(34));
    return v0;
}

function _SafeMul(uint256 varg0, uint256 varg1) private { 
    require(!(varg0 & (varg1 > ~0 / varg0)), Panic(17));
    return varg0 * varg1;
}

function _SafeDiv(uint256 varg0, uint256 varg1) private { 
    require(varg1, Panic(18));
    return varg0 / varg1;
}

function 0x368a(uint256 varg0) private { 
    require(varg0 + 1, Panic(17));
    return 1 + varg0;
}

function _SafeAdd(uint256 varg0, uint256 varg1) private { 
    require(varg0 <= ~varg1, Panic(17));
    return varg0 + varg1;
}

function _SafeSub(uint256 varg0, uint256 varg1) private { 
    require(varg0 >= varg1, Panic(17));
    return varg0 - varg1;
}

function claim(address varg0, uint256 varg1, uint256 varg2) public payable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    0x988(varg2, varg1, varg0);
}

function 0x3910() private { 
    if (RETURNDATASIZE() >= 68) {
        RETURNDATACOPY(MEM[64], 4, ~3 + RETURNDATASIZE());
        if (!((MEM[MEM[64]] > 0xffffffffffffffff) | (MEM[MEM[64]] + 36 > RETURNDATASIZE()))) {
            if (MEM[MEM[64] + MEM[MEM[64]]] <= 0xffffffffffffffff) {
                if (MEM[64] + MEM[MEM[64]] + MEM[MEM[64] + MEM[MEM[64]]] + 32 <= MEM[64] + RETURNDATASIZE() + ~3) {
                    0x2edd(MEM[64], MEM[MEM[64]] + MEM[MEM[64] + MEM[MEM[64]]] + 32);
                    return MEM[64] + MEM[MEM[64]];
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

function safeBatchTransferFrom(address varg0, address varg1, uint256[] varg2, uint256[] varg3, bytes varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v0 = 0x2f09(varg2.length);
    0x2edd(MEM[64], v0);
    MEM[MEM[64]] = varg2.length;
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg2 + (varg2.length << 5)) <= msg.data.length);
    v3 = v4 = varg2.data;
    while (v3 < 32 + (4 + varg2 + (varg2.length << 5))) {
        MEM[v1] = msg.data[v3];
        v1 += 32;
        v3 += 32;
    }
    require(varg3 <= 0xffffffffffffffff);
    require(4 + varg3 + 31 < msg.data.length);
    v5 = 0x2f09(varg3.length);
    0x2edd(MEM[64], v5);
    MEM[MEM[64]] = varg3.length;
    v6 = v7 = MEM[64] + 32;
    require(32 + (4 + varg3 + (varg3.length << 5)) <= msg.data.length);
    v8 = v9 = varg3.data;
    while (v8 < 32 + (4 + varg3 + (varg3.length << 5))) {
        MEM[v6] = msg.data[v8];
        v6 += 32;
        v8 += 32;
    }
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= 0xffffffffffffffff, Panic(65));
    0x2edd(MEM[64], 32 + (~0x1f & varg4.length + 31));
    require(varg4.data + varg4.length <= msg.data.length);
    CALLDATACOPY(v10.data, varg4.data, varg4.length);
    v10[varg4.length] = 0;
    0xa8b(MEM[64], MEM[64], MEM[64], varg1, varg0);
}

function setOperatorRestriction(bool varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(msg.sender == _owner, Error('Not authorized to set operator restriction.'));
    _operatorRestriction = varg0;
    emit 0x38475885990d8dfe9ca01f0ef160a1b5514426eab9ddbc953a3353410ba78096(varg0);
}

function nextTokenIdToMint() public nonPayable { 
    return _nextTokenIdToMint;
}

function OPERATOR_FILTER_REGISTRY() public nonPayable { 
    return 0xaaeb6d7670e522a718067333cd4e;
}

function 0x4bbb1abf(uint256 varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == address(varg0));
    0xb2b(varg2, varg1, varg0);
}

function getRoyaltyInfoForToken(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    v0, v1 = 0xcef(varg0);
    return address(v1), uint16(v0);
}

function balanceOfBatch(address[] varg0, uint256[] varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = 0x2f09(varg0.length);
    0x2edd(MEM[64], v0);
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg0 + (varg0.length << 5)) <= msg.data.length);
    v3 = v4 = varg0.data;
    while (v3 < 32 + (4 + varg0 + (varg0.length << 5))) {
        require(msg.data[v3] == address(msg.data[v3]));
        MEM[v1] = msg.data[v3];
        v3 += 32;
        v1 += 32;
    }
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v5 = 0x2f09(varg1.length);
    0x2edd(MEM[64], v5);
    v6 = v7 = MEM[64] + 32;
    require(32 + (4 + varg1 + (varg1.length << 5)) <= msg.data.length);
    v8 = v9 = varg1.data;
    while (v8 < 32 + (4 + varg1 + (varg1.length << 5))) {
        MEM[v6] = msg.data[v8];
        v6 += 32;
        v8 += 32;
    }
    require(varg0.length == varg1.length, Error('LENGTH_MISMATCH'));
    require(varg0.length <= 0xffffffffffffffff, Panic(65));
    v10 = new uint256[](varg0.length);
    if (varg0.length) {
        CALLDATACOPY(v10.data, msg.data.length, varg0.length << 5);
    }
    v11 = v12 = 0;
    while (v11 < varg0.length) {
        if (v11 < varg0.length) {
            break;
        }
        require(v11 < varg0.length, Panic(50));
        require(v11 < varg1.length, Panic(50));
        require(v11 < v10.length, Panic(50));
        v10[v11] = _balanceOf[address(MEM[32 + (v11 << 5) + MEM[64]])][MEM[32 + (v11 << 5) + MEM[64]]];
        v11 = 0x368a(v11);
    }
    v13 = new array[](v10.length);
    v14 = v15 = v13.data;
    v16 = v17 = v10.data;
    v18 = v19 = 0;
    while (v18 < v10.length) {
        MEM[v14] = MEM[v16];
        v14 += 32;
        v16 += 32;
        v18 += 1;
    }
    return v13;
}

function operatorRestriction() public nonPayable { 
    return _operatorRestriction;
}

function setDefaultRoyaltyInfo(address varg0, uint256 varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(msg.sender == _owner, Error('Not authorized'));
    require(varg1 <= 10000, Error('Exceeds max bps'));
    _getDefaultRoyaltyInfo = uint16(varg1) << 160 | (varg0 | _getDefaultRoyaltyInfo & ~0xffffffffffffffffffffffffffffffffffffffffffff);
    emit DefaultRoyalty(varg0, varg1);
}

function getBaseURICount() public nonPayable { 
    return _getBaseURICount.length;
}

function burnBatch(address varg0, uint256[] varg1, uint256[] varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    v0 = 0x2f09(varg1.length);
    0x2edd(MEM[64], v0);
    v1 = v2 = MEM[64] + 32;
    require(32 + (4 + varg1 + (varg1.length << 5)) <= msg.data.length);
    v3 = v4 = varg1.data;
    while (v3 < 32 + (4 + varg1 + (varg1.length << 5))) {
        MEM[v1] = msg.data[v3];
        v1 += 32;
        v3 += 32;
    }
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    v5 = 0x2f09(varg2.length);
    0x2edd(MEM[64], v5);
    v6 = v7 = MEM[64] + 32;
    require(32 + (4 + varg2 + (varg2.length << 5)) <= msg.data.length);
    v8 = v9 = varg2.data;
    while (v8 < 32 + (4 + varg2 + (varg2.length << 5))) {
        MEM[v6] = msg.data[v8];
        v6 += 32;
        v8 += 32;
    }
    v10 = v11 = msg.sender == varg0;
    if (msg.sender != varg0) {
        v10 = 0xff & _isApprovedForAll[varg0][msg.sender];
    }
    require(v10, Error('Unapproved caller'));
    require(varg1.length == varg2.length, Error('Length mismatch'));
    v12 = v13 = 0;
    while (v12 < varg1.length) {
        if (v12 < varg2.length) {
            break;
        }
        require(v12 < varg2.length, Panic(50));
        require(v12 < varg1.length, Panic(50));
        require(_balanceOf[varg0][MEM[32 + (v12 << 5) + MEM[64]]] >= MEM[32 + (v12 << 5) + MEM[64]], Error('Not enough tokens owned'));
        v12 = _SafeAdd(v12, 1);
    }
    require(varg0, Error('FROM_ZERO_ADDR'));
    require(varg1.length == varg2.length, Error('LENGTH_MISMATCH'));
    MEM[MEM[64]] = 0;
    0x266d(MEM[64], MEM[64], MEM[64], 0, varg0, msg.sender);
    v14 = v15 = 0;
    while (v14 < varg1.length) {
        if (v14 < varg1.length) {
            break;
        }
        require(v14 < varg1.length, Panic(50));
        if (v14 < varg2.length) {
            break;
        }
        require(v14 < varg2.length, Panic(50));
        require(_balanceOf[varg0][MEM[32 + (v14 << 5) + MEM[64]]] >= MEM[32 + ((v14 << 5) + MEM[64])], Error('INSUFFICIENT_BAL'));
        _balanceOf[varg0][MEM[32 + (v14 << 5) + MEM[64]]] = _balanceOf[varg0][MEM[32 + (v14 << 5) + MEM[64]]] - MEM[32 + ((v14 << 5) + MEM[64])];
        v14 = 0x368a(v14);
    }
    v16 = new array[](varg1.length);
    v17 = v18 = v16.data;
    v19 = v20 = MEM[64] + 32;
    v21 = v22 = 0;
    while (v21 < varg1.length) {
        MEM[v17] = MEM[v19];
        v17 += 32;
        v19 += 32;
        v21 += 1;
    }
    v17 = new array[](varg2.length);
    v23 = v24 = v17.data;
    v25 = v26 = MEM[64] + 32;
    v27 = v28 = 0;
    while (v27 < varg2.length) {
        MEM[v23] = MEM[v25];
        v23 += 32;
        v25 += 32;
        v27 += 1;
    }
    emit TransferBatch(msg.sender, varg0, 0, v16, v17);
}

function stopGame() public nonPayable { 
    require(msg.sender == _owner, Error('Only owner can stop the game'));
    _isGamePaused = 1;
}

function owner() public nonPayable { 
    return _owner;
}

function setContractURI(string varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0xffffffffffffffff);
    require(msg.data.length > 4 + varg0 + 31);
    require(varg0.length <= 0xffffffffffffffff, Panic(65));
    0x2edd(MEM[64], 32 + (~0x1f & varg0.length + 31));
    require(varg0.data + varg0.length <= msg.data.length);
    CALLDATACOPY(v0.data, varg0.data, varg0.length);
    v0[varg0.length] = 0;
    require(msg.sender == _owner, Error('Not authorized'));
    v1 = 0x355b(_setContractURI.length);
    v2 = new bytes[](v1);
    v3 = v4 = v2.data;
    v5 = 0x355b(_setContractURI.length);
    if (v5) {
        if (31 < v5) {
            v6 = v7 = _setContractURI.data;
            do {
                MEM[v3] = STORAGE[v6];
                v6 += 1;
                v3 += 32;
            } while (v4 + v5 <= v3);
        } else {
            MEM[v4] = _setContractURI.length >> 8 << 8;
        }
    }
    v8 = v9 = v0.data;
    v10 = 0x355b(_setContractURI.length);
    v11 = v12 = _setContractURI.data;
    if (v0.length) {
        if (31 < v0.length) {
            _setContractURI = 1 + (v0.length + v0.length);
            if (v0.length) {
                while (v9 + v0.length > v8) {
                    STORAGE[v11] = MEM[v8];
                    v8 += 32;
                    v11 += 1;
                }
            }
        } else {
            _setContractURI = v0.length + v0.length | ~0xff & MEM[v9];
        }
    } else {
        _setContractURI = 0;
    }
    while (v12 + (31 + v10 >> 5) > v11) {
        STORAGE[v11] = 0;
        v11 += 1;
    }
    v13 = new array[](v2.length);
    v14 = v15 = 0;
    while (v14 < v2.length) {
        v13[v14] = v2[v14];
        v14 += 32;
    }
    if (v14 <= v2.length) {
        goto 0x2e17B0x382bB0x204eB0x56f;
    } else {
        v13[v2.length] = 0;
    }
    v16 = new array[](v0.length);
    v13[~0x1f & 31 + v2.length] = v0.length;
    v17 = v18 = 0;
    while (v17 < v0.length) {
        MEM[v17 + v16.data] = v0[v17];
        v17 += 32;
    }
    if (v17 <= v0.length) {
        goto 0x2e17B0x383eB0x204eB0x56f;
    } else {
        MEM[v0.length + v16.data] = 0;
    }
    emit ContractURIUpdated(v13, v16);
}

function symbol() public nonPayable { 
    v0, v1 = 0x10de();
    v2 = new array[](v0.length);
    v3 = v4 = 0;
    while (v3 < v0.length) {
        v2[v3] = v0[v3];
        v3 += 32;
    }
    if (v3 <= v0.length) {
        goto 0x2e17B0x2e2bB0x2d30x574;
    } else {
        v2[v0.length] = 0;
    }
    return v2;
}

function setRoyaltyInfoForToken(uint256 varg0, address varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg1 == varg1);
    require(msg.sender == _owner, Error('Not authorized'));
    require(varg2 <= 10000, Error('Exceeds max bps'));
    MEM[64] += 64;
    STORAGE[keccak256(varg0, 8)] = varg1 | ~0xffffffffffffffffffffffffffffffffffffffff & STORAGE[keccak256(varg0, 8)];
    map_8[varg0] = varg2;
    emit RoyaltyForToken(varg0, varg1, varg2);
}

function setApprovalForAll(address varg0, bool varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 == varg1);
    0x1bbc(varg0);
    require(msg.sender - varg0, Error('APPROVING_SELF'));
    _isApprovedForAll[msg.sender][varg0] = varg1 | ~0xff & _isApprovedForAll[msg.sender][varg0];
    emit ApprovalForAll(msg.sender, varg0, varg1);
}

function multicall(bytes[] varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 <= 0xffffffffffffffff);
    require(4 + varg0 + 31 < msg.data.length);
    v0 = v1 = varg0.length;
    require(v1 <= 0xffffffffffffffff);
    require(4 + varg0 + (v1 << 5) + 32 <= msg.data.length);
    require(v1 <= 0xffffffffffffffff, Panic(65));
    v2 = new uint256[](v1);
    if (v1) {
        v3 = v2.data;
        do {
            MEM[v3] = 96;
            v3 += 32;
            v0 = v0 - 1;
        } while (!v0);
    }
    v4 = v5 = 0;
    while (v4 < v1) {
        if (v4 < v1) {
            break;
        }
        require(v4 < v1, Panic(50));
        if (varg0[v4] < msg.data.length - varg0.data + ~30) {
            break;
        }
        require(varg0[v4] < msg.data.length - varg0.data + ~30);
        if (varg0[varg0[v4]] <= 0xffffffffffffffff) {
            break;
        }
        require(varg0[varg0[v4]] <= 0xffffffffffffffff);
        if (32 + (varg0.data + varg0[v4]) <= msg.data.length - varg0[varg0[v4]]) {
            break;
        }
        require(32 + (varg0.data + varg0[v4]) <= msg.data.length - varg0[varg0[v4]]);
        v6 = new bytes[](varg0[varg0[v4]]);
        CALLDATACOPY(v6.data, 32 + (varg0.data + varg0[v4]), varg0[varg0[v4]]);
        v6[varg0[varg0[v4]]] = 0;
        if ((address(this)).code.size) {
            break;
        }
        require((address(this)).code.size, Error('Address: delegate call to non-contract'));
        v7 = v8 = 0;
        while (v7 < v6.length) {
            MEM[v7 + v9.data] = v6[v7];
            v7 += 32;
        }
        if (v7 <= v6.length) {
            goto 0x3888B0x21fcB0x5e4;
        } else {
            MEM[v6.length + v9.data] = 0;
        }
        v10, v11, v12 = address(this).delegatecall(v9.data).gas(msg.gas);
        if (RETURNDATASIZE() == 0) {
            v13 = v14 = 96;
        } else {
            v13 = v15 = new bytes[](RETURNDATASIZE());
            RETURNDATACOPY(v15.data, 0, RETURNDATASIZE());
        }
        if (!v10) {
            require(!MEM[v13]v12, MEM[v13]);
            v16 = new array[](v17.length);
            v18 = v19 = 0;
            while (v18 < v17.length) {
                v16[v18] = v17[v18];
                v18 += 32;
            }
            if (v18 <= v17.length) {
                goto 0x2e17B0x2e2bB0x2b81B0x2845B0x21fcB0x5e4;
            } else {
                v16[v17.length] = 0;
            }
            revert(Error(v16));
        } else {
            require(v4 < v2.length, Panic(50));
            v2[v4] = v13;
            v4 = 0x368a(v4);
        }
    }
    v20 = new array[](v2.length);
    v21 = v22 = v20.data;
    v23 = v24 = MEM[64] + (v2.length << 5) + 64;
    v25 = v26 = v2.data;
    v27 = v28 = 0;
    while (v27 < v2.length) {
        MEM[v21] = v23 - MEM[64] + ~63;
        MEM[v23] = MEM[MEM[v25]];
        v29 = v30 = 0;
        while (v29 < MEM[MEM[v25]]) {
            MEM[v29 + (v23 + 32)] = MEM[v29 + (MEM[v25] + 32)];
            v29 += 32;
        }
        if (v29 <= MEM[MEM[v25]]) {
            goto 0x2e17B0x33d1B0x5e9;
        } else {
            MEM[MEM[MEM[v25]] + (v23 + 32)] = 0;
        }
        v23 = 32 + ((~0x1f & 31 + MEM[MEM[v25]]) + v23);
        v21 += 32;
        v25 += 32;
        v27 += 1;
    }
    return v20;
}

function getDefaultRoyaltyInfo() public nonPayable { 
    return address(_getDefaultRoyaltyInfo), uint16(_getDefaultRoyaltyInfo >> 160);
}

function totalSupply(uint256 varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    return _totalSupply[varg0];
}

function 0xbe895ece() public nonPayable { 
    0x988(1, 0, msg.sender);
    emit LevelUp(msg.sender, 1);
}

function attack(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    require(!_isGamePaused, Error('Game is paused'));
    require(_balanceOf[msg.sender][2], Error('You need a ninja cat to attack!'));
    if (!_balanceOf[varg0][0]) {
        if (!_balanceOf[varg0][1]) {
            require(_balanceOf[varg0][2], Error('Victim has no cat!'));
            v0 = 2;
        } else {
            v0 = v1 = 1;
        }
    } else {
        v0 = v2 = 0;
    }
    0x2228(1, v0, varg0);
    MEM[MEM[64]] = 0;
    0x234d(MEM[64], 1, 3, msg.sender);
    v3 = _SafeAdd(1, v0);
    emit 0xeb774bb9698a73583fe07b6972cf2dcc08d1d97581a22861f45feb86b395820(msg.sender, varg0, v3);
}

function lazyMint(uint256 varg0, string varg1, bytes varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg1 <= 0xffffffffffffffff);
    require(4 + varg1 + 31 < msg.data.length);
    require(varg1.length <= 0xffffffffffffffff);
    require(4 + varg1 + varg1.length + 32 <= msg.data.length);
    require(varg2 <= 0xffffffffffffffff);
    require(4 + varg2 + 31 < msg.data.length);
    require(varg2.length <= 0xffffffffffffffff);
    require(4 + varg2 + varg2.length + 32 <= msg.data.length);
    require(msg.sender == _owner, Error('Not authorized'));
    require(0 - varg0, Error(0x3020616d74000000000000000000000000000000000000000000000000000000));
    v0 = new bytes[](varg1.length);
    CALLDATACOPY(v0.data, varg1.data, varg1.length);
    v0[varg1.length] = 0;
    v1 = _SafeAdd(_nextTokenIdToMint, varg0);
    _getBaseURICount = _getBaseURICount.length + 1;
    STORAGE[0x6e1540171b6c0c960b71a7020d9f60077f6af931a8bbf590da0223dacf75c7af + _getBaseURICount.length] = v1;
    v2 = v3 = v0.data;
    v4 = 0x355b(map_a[v1].length);
    v5 = v6 = map_a[v1].data;
    if (v0.length) {
        if (31 < v0.length) {
            map_a[v1].length = 1 + (v0.length + v0.length);
            if (v0.length) {
                while (v3 + v0.length > v2) {
                    STORAGE[v5] = MEM[v2];
                    v2 += 32;
                    v5 += 1;
                }
            }
        } else {
            map_a[v1].length = v0.length + v0.length | ~0xff & MEM[v3];
        }
    } else {
        map_a[v1].length = 0;
    }
    while (v6 + (31 + v4 >> 5) > v5) {
        STORAGE[v5] = 0;
        v5 += 1;
    }
    _nextTokenIdToMint = v1;
    v7 = _SafeAdd(_nextTokenIdToMint, varg0);
    v8 = _SafeSub(v7, 1);
    v9[varg1.length] = 0;
    v9[~0x1f & varg1.length + 31] = varg2.length;
    CALLDATACOPY(v10.data, varg2.data, varg2.length);
    v10[varg2.length] = 0;
    emit TokensLazyMinted(_nextTokenIdToMint, v8, MEM[64] + 96, MEM[64] + 96 + (~0x1f & varg1.length + 31) + 32);
    return v1;
}

function getScore(address varg0) public nonPayable { 
    require(msg.data.length - 4 >= 32);
    require(varg0 == varg0);
    v0 = _SafeMul(3, _balanceOf[varg0][2]);
    v1 = _SafeMul(2, _balanceOf[varg0][1]);
    v2 = _SafeAdd(_balanceOf[varg0][0], v1);
    v3 = _SafeAdd(v2, v0);
    v4 = _SafeAdd(v3, _balanceOf[varg0][3]);
    return v4;
}

function startGame() public nonPayable { 
    require(msg.sender == _owner, Error('Only owner can start the game'));
    _isGamePaused = 0;
}

function contractURI() public nonPayable { 
    v0, v1 = 0x1640();
    v2 = new array[](v0.length);
    v3 = v4 = 0;
    while (v3 < v0.length) {
        v2[v3] = v0[v3];
        v3 += 32;
    }
    if (v3 <= v0.length) {
        goto 0x2e17B0x2e2bB0x2d30x6d8;
    } else {
        v2[v0.length] = 0;
    }
    return v2;
}

function isApprovedForAll(address varg0, address varg1) public nonPayable { 
    require(msg.data.length - 4 >= 64);
    require(varg0 == varg0);
    require(varg1 == varg1);
    return 0xff & _isApprovedForAll[varg0][varg1];
}

function safeTransferFrom(address varg0, address varg1, uint256 varg2, uint256 varg3, bytes varg4) public nonPayable { 
    require(msg.data.length - 4 >= 160);
    require(varg0 == varg0);
    require(varg1 == varg1);
    require(varg4 <= 0xffffffffffffffff);
    require(4 + varg4 + 31 < msg.data.length);
    require(varg4.length <= 0xffffffffffffffff, Panic(65));
    0x2edd(MEM[64], 32 + (~0x1f & varg4.length + 31));
    require(varg4.data + varg4.length <= msg.data.length);
    CALLDATACOPY(v0.data, varg4.data, varg4.length);
    v0[varg4.length] = 0;
    require(!_isGamePaused, Error('Game is paused'));
    require(!varg2, Error('This cat is not transferable!'));
    if (msg.sender != varg0) {
        0x1bbc(msg.sender);
    }
    v1 = v2 = msg.sender == varg0;
    if (msg.sender != varg0) {
        v1 = 0xff & _isApprovedForAll[varg0][msg.sender];
    }
    require(v1, Error('!OWNER_OR_APPROVED'));
    require(varg1, Error('TO_ZERO_ADDR'));
    v3 = 0x285f(varg2);
    v4 = 0x285f(varg3);
    0x266d(MEM[64], v4, v3, varg1, varg0, msg.sender);
    require(_balanceOf[varg0][varg2] >= varg3, Error('INSUFFICIENT_BAL'));
    _balanceOf[varg0][varg2] = _balanceOf[varg0][varg2] - varg3;
    v5 = _SafeAdd(_balanceOf[varg1][varg2], varg3);
    _balanceOf[varg1][varg2] = v5;
    emit TransferSingle(msg.sender, varg0, varg1, varg2, varg3);
    0x28aa(MEM[64], varg3, varg2, varg1, varg0, msg.sender);
    v6 = v7 = varg0 != varg1;
    if (v7) {
        v6 = !varg2;
    }
    if (v6) {
        MEM[MEM[64]] = 0;
        0x234d(MEM[64], 1, 1, varg0);
        emit LevelUp(varg1, 1);
        emit LevelUp(varg0, 2);
        goto 0x4c00;
    }
}

function burn(address varg0, uint256 varg1, uint256 varg2) public nonPayable { 
    require(msg.data.length - 4 >= 96);
    require(varg0 == varg0);
    require(!_isGamePaused, Error('Game is paused'));
    v0 = v1 = varg0 == msg.sender;
    if (varg0 != msg.sender) {
        v0 = _balanceOf[msg.sender][2];
    }
    require(v0, Error('NOT_TOKEN_OWNER or ninja cat'));
    0x2228(varg2, varg1, varg0);
    if (!(1 - varg1)) {
        MEM[MEM[64]] = 0;
        0x234d(MEM[64], 1, 2, varg0);
        emit LevelUp(varg0, 3);
        goto 0x3200x748;
    }
}

function 0x768(uint256 varg0) private { 
    v0 = v1 = varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff == 0x1ffc9a700000000000000000000000000000000000000000000000000000000;
    if (varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff != 0x1ffc9a700000000000000000000000000000000000000000000000000000000) {
        v0 = v2 = varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff == 0xd9b67a2600000000000000000000000000000000000000000000000000000000;
    }
    if (!v0) {
        v0 = v3 = varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff == 0xe89341c00000000000000000000000000000000000000000000000000000000;
    }
    if (v0) {
        return v0;
    } else {
        return 0x2a55205a00000000000000000000000000000000000000000000000000000000 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
}

function 0x7d5() private { 
    v0 = 0x355b(array_0.length);
    v1 = new bytes[](v0);
    v2 = v3 = v1.data;
    v4 = 0x355b(array_0.length);
    if (!v4) {
        return v1, v5;
    } else if (31 < v4) {
        v6 = array_0.data;
        do {
            MEM[v2] = STORAGE[v6];
            v6 += 1;
            v2 += 32;
        } while (v3 + v4 <= v2);
        return v1, v5;
    } else {
        MEM[v3] = array_0.length >> 8 << 8;
        return v1, v5;
    }
}

function 0x988(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(stor_d - 2, Error('ReentrancyGuard: reentrant call'));
    stor_d = 2;
    require(varg1 < _nextTokenIdToMint, Error('invalid id'));
    0xb2b(varg0, varg1, msg.sender);
    MEM[MEM[64]] = 0;
    0x234d(MEM[64], varg0, varg1, varg2);
    emit TokensClaimed(msg.sender, address(varg2), varg1, varg0);
    stor_d = 1;
    return ;
}

function 0xa8b(uint256 varg0, uint256 varg1, uint256 varg2, uint256 varg3, uint256 varg4) private { 
    if (msg.sender != address(varg4)) {
        0x1bbc(msg.sender);
    }
    v0 = v1 = msg.sender == address(varg4);
    if (msg.sender != address(varg4)) {
        v2 = address(varg4);
        v0 = 0xff & _isApprovedForAll[v2][msg.sender];
    }
    require(v0, Error('!OWNER_OR_APPROVED'));
    require(MEM[varg2] == MEM[varg1], Error('LENGTH_MISMATCH'));
    require(address(varg3), Error('TO_ZERO_ADDR'));
    0x266d(varg0, varg1, varg2, varg3, varg4, msg.sender);
    v3 = v4 = 0;
    while (v3 < MEM[varg2]) {
        if (v3 < MEM[varg2]) {
            break;
        }
        require(v3 < MEM[varg2], Panic(50));
        v5 = MEM[32 + (v3 << 5) + varg2];
        if (v3 < MEM[varg1]) {
            break;
        }
        require(v3 < MEM[varg1], Panic(50));
        v6 = MEM[32 + ((v3 << 5) + varg1)];
        v7 = address(varg4);
        require(_balanceOf[v7][v5] >= v6, Error('INSUFFICIENT_BAL'));
        v8 = address(varg4);
        _balanceOf[v8][v5] = _balanceOf[v7][v5] - v6;
        v9 = address(varg3);
        v10 = _SafeAdd(_balanceOf[v9][v5], v6);
        _balanceOf[v9][v5] = v10;
        v3 = 0x368a(v3);
    }
    v11 = new array[](v12);
    v12 = MEM[varg2];
    v13 = v14 = v11.data;
    v15 = v16 = varg2 + 32;
    v17 = v18 = 0;
    while (v17 < v12) {
        MEM[v13] = MEM[v15];
        v13 += 32;
        v15 += 32;
        v17 += 1;
    }
    v13 = new array[](v19);
    v19 = MEM[varg1];
    v20 = v21 = v13.data;
    v22 = v23 = varg1 + 32;
    v24 = v25 = 0;
    while (v24 < v19) {
        MEM[v20] = MEM[v22];
        v20 += 32;
        v22 += 32;
        v24 += 1;
    }
    emit TransferBatch(msg.sender, address(varg4), address(varg3), v11, v13);
    if ((address(varg3)).code.size) {
        v26 = address(varg4);
        v27 = new array[](v28);
        v28 = MEM[varg2];
        v29 = v30 = v27.data;
        v31 = v32 = varg2 + 32;
        v33 = v34 = 0;
        while (v33 < v28) {
            MEM[v29] = MEM[v31];
            v29 += 32;
            v31 += 32;
            v33 += 1;
        }
        v29 = new array[](v35);
        v35 = MEM[varg1];
        v36 = v37 = v29.data;
        v38 = v39 = varg1 + 32;
        v40 = v41 = 0;
        while (v40 < v35) {
            MEM[v36] = MEM[v38];
            v36 += 32;
            v38 += 32;
            v40 += 1;
        }
        v36 = new array[](varg0.length);
        v42 = v43 = 0;
        while (v42 < varg0.length) {
            MEM[v42 + v36.data] = varg0[v42];
            v42 += 32;
        }
        if (v42 <= varg0.length) {
            goto 0x2e17B0x39d7B0x2a96B0x2657B0x1cfbB0xaa5;
        } else {
            MEM[varg0.length + v36.data] = 0;
        }
        v44 = v45, varg0 = address(varg3).onERC1155BatchReceived(msg.sender, v26, v27, v29, v36).gas(msg.gas);
        if (v45) {
            require(MEM[64] + RETURNDATASIZE() - MEM[64] >= 32);
            require(varg0 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
            v44 = 1;
        }
        if (v44) {
            require(0xbc197c8100000000000000000000000000000000000000000000000000000000 == varg0 & ~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff, Error('TOKENS_REJECTED'));
            goto 0x50d0B0x1cfbB0xaa5;
        } else {
            v46 = v47 = 0;
            if (RETURNDATASIZE() > 3) {
                RETURNDATACOPY(0, 0, 4);
                v46 = v48 = MEM[0] >> 224;
            }
            if (!(0x8c379a0 - v46)) {
                v49 = 0x3910();
                if (v49) {
                    v50 = new array[](MEM[v49]);
                    v51 = v52 = 0;
                    while (v51 < MEM[v49]) {
                        v50[v51] = MEM[v51 + (v49 + 32)];
                        v51 += 32;
                    }
                    if (v51 <= MEM[v49]) {
                        goto 0x2e17B0x2e2bB0x29540x2a85B0x2657B0x1cfbB0xaa5;
                    } else {
                        v50[MEM[v49]] = 0;
                    }
                    revert(Error(v50));
                }
            }
            revert(Error('!ERC1155RECEIVER'));
        }
    }
    return ;
}

function 0xb2b(uint256 varg0, uint256 varg1, uint256 varg2) private { 
    require(!_isGamePaused, Error('GAME_PAUSED'));
    require(!varg1, Error('Only Kittens can be claimed'));
    require(!_balanceOf[msg.sender][0], Error('Already got a Kitten'));
    require(!_balanceOf[msg.sender][1], Error('Already got a Grumpy cat'));
    require(!_balanceOf[msg.sender][2], Error('Already got a Ninja cat'));
    return ;
}

function 0xcef(uint256 varg0) private { 
    v0 = map_8[varg0];
    if (!address(STORAGE[v1])) {
        v2 = v3 = address(_getDefaultRoyaltyInfo);
        v4 = v5 = uint16(_getDefaultRoyaltyInfo >> 160);
    }
    return v4, v2;
}

// Note: The function selector is not present in the original solidity code.
// However, we display it for the sake of completeness.

function __function_selector__(bytes4 function_selector) public payable { 
    MEM[64] = 128;
    if (msg.data.length >= 4) {
        v0 = function_selector >> 224;
        if (0x6b20c454 > v0) {
            if (0x2eb2c2d6 > v0) {
                if (0xe89341c > v0) {
                    if (0xfdd58e == v0) {
                        balanceOf(address,uint256);
                    } else if (0x1ffc9a7 == v0) {
                        supportsInterface(bytes4);
                    } else if (0x422ddf3 == v0) {
                        isGamePaused();
                    } else if (0x6fdde03 == v0) {
                        name();
                    }
                } else if (0xe89341c == v0) {
                    uri(uint256);
                } else if (0x13af4035 == v0) {
                    setOwner(address);
                } else if (0x2419f51b == v0) {
                    getBatchIdAtIndex(uint256);
                } else if (0x2a55205a == v0) {
                    royaltyInfo(uint256,uint256);
                } else {
                    require(0x2bc43fd9 == v0);
                    claim(address,uint256,uint256);
                }
            } else if (0x4cc157df > v0) {
                if (0x2eb2c2d6 == v0) {
                    safeBatchTransferFrom(address,address,uint256[],uint256[],bytes);
                } else if (0x32f0cd64 == v0) {
                    setOperatorRestriction(bool);
                } else if (0x3b1475a7 == v0) {
                    nextTokenIdToMint();
                } else if (0x41f43434 == v0) {
                    OPERATOR_FILTER_REGISTRY();
                } else {
                    require(0x4bbb1abf == v0);
                    0x4bbb1abf();
                }
            } else if (0x4cc157df == v0) {
                getRoyaltyInfoForToken(uint256);
            } else if (0x4e1273f4 == v0) {
                balanceOfBatch(address[],uint256[]);
            } else if (0x504c6e01 == v0) {
                operatorRestriction();
            } else if (0x600dd5ea == v0) {
                setDefaultRoyaltyInfo(address,uint256);
            } else {
                require(0x63b45e2d == v0);
                getBaseURICount();
            }
        } else if (0xbd85b039 > v0) {
            if (0x95d89b41 > v0) {
                if (0x6b20c454 == v0) {
                    burnBatch(address,uint256[],uint256[]);
                } else if (0x83bd72ba == v0) {
                    stopGame();
                } else if (0x8da5cb5b == v0) {
                    owner();
                } else {
                    require(0x938e3d7b == v0);
                    setContractURI(string);
                }
            } else if (0x95d89b41 == v0) {
                symbol();
            } else if (0x9bcf7a15 == v0) {
                setRoyaltyInfoForToken(uint256,address,uint256);
            } else if (0xa22cb465 == v0) {
                setApprovalForAll(address,bool);
            } else if (0xac9650d8 == v0) {
                multicall(bytes[]);
            } else {
                require(0xb24f2d39 == v0);
                getDefaultRoyaltyInfo();
            }
        } else if (0xd65ab5f2 > v0) {
            if (0xbd85b039 == v0) {
                totalSupply(uint256);
            } else if (0xbe895ece == v0) {
                0xbe895ece();
            } else if (0xd018db3e == v0) {
                attack(address);
            } else if (0xd37c353b == v0) {
                lazyMint(uint256,string,bytes);
            } else {
                require(0xd47875d0 == v0);
                getScore(address);
            }
        } else if (0xd65ab5f2 == v0) {
            startGame();
        } else if (0xe8a3d485 == v0) {
            contractURI();
        } else if (0xe985e9c5 == v0) {
            isApprovedForAll(address,address);
        } else if (0xf242432a == v0) {
            safeTransferFrom(address,address,uint256,uint256,bytes);
        } else {
            require(0xf5298aca == v0);
            burn(address,uint256,uint256);
        }
    }
    ();
}
