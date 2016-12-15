pragma solidity ^0.4.7;

contract ProofOfTransaction {

  mapping (address => byte32) dataHashMap; // dataHash = sha3(data)  

  // 寫入時記錄誰將資料存入
  event sendDataHashedEvent(byte32 dataHash, address from, uint time);
  // 當有人查詢 dataHash 的時候紀錄下來
  event sendIsDataHashExistEvent(byte32 dataHash, address from, uint time, bool exist);
  
  function setData(address from, string data) {
    // 將資料透過 SHA3 運算後存入 dataArray 中
    byte32 dataHash = sha3(data);
    dataHashMap[tx.origin] = dataHash;
    
    // 可以透過 send event 讓 web3.js 去接收，有這個就可以直接把 isExist 忽略
    sendDataHashedEvent(dataHash, from, now);
  }
  
  function getDataHash(address txHash) returns (byte32) {
    // 透過 txHash 取得儲存的 dataHash
    byte32 dataHash = dataHashMap[txHash];
    if (dataHash == 0) {
      return "";
    } else {
      return dataHash;
    } 
  }
  
  function isDataHashExist(address txHash, byte32 dataHash) returns (bool) {
    // 確認是否 dataHash 存在
    bool exist = false;
    
    // do something
    byte32 storedDataHash = dataHashMap[txHash];
    if (dataHash == storedDataHash) {
      exist = true;
    }
    
    sendIsDataHashExistEvent(dataHash, msg.sender, now, exist);
    
    return exist;
  }
}
