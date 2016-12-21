FROM kunstmaan/ethereum-geth
MAINTAINER Roderik van der Veer

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y build-essential checkinstall curl libssl-dev nodejs

RUN apt-get install -y vim npm git

RUN npm install web3 express

#ADD ./account /root/primaryaccount
#ADD ./password /root/accountpassowrd

ADD ./testnet.sh /root/testnet.sh
RUN chmod +x /root/testnet.sh

ADD ./scripts/init.js /usr/local/src/init.js

CMD /root/testnet.sh
