pragma solidity ^0.4.6;

contract ProofOfTransaction {
  bytes32 public dataHash;

  mapping (address => bytes32) dataHashMap;

  // 寫入時記錄誰將資料存入
  event sendDataHashEvent(bytes32 dataHash, address from, uint time);
  // 當有人查詢 dataHash 的時候紀錄下來
  event sendMatchDataHashEvent(bytes32 dataHash, address from, uint time, bool exist);
  
  function setData(string data) {
    // 將資料透過 SHA3 運算後存入 dataArray 中
    dataHash = sha3(data);
    dataHashMap[tx.origin] = dataHash;
    
    // 可以透過 send event 讓 web3.js 去接收，有這個就可以直接把 isExist 忽略
    sendDataHashEvent(dataHashMap[tx.origin], tx.origin, now);
  }
  
  function getDataHash(address txHash) returns (bytes32) {
    // 透過 txHash 取得儲存的 dataHash
    dataHash = dataHashMap[txHash];
    if (dataHash == 0) {
      return "";
    } else {
      return dataHash;
    } 
  }
  
  function matchDataHash(address txHash, bytes32 dataHash) returns (bool) {
    // 確認是否 dataHash 存在
    bool exist = false;
    
    // do something
    bytes32 storedDataHash = dataHashMap[txHash];
    if (dataHash == storedDataHash) {
      exist = true;
    }
    
    sendMatchDataHashEvent(dataHash, msg.sender, now, exist);
    
    return exist;
  }
}