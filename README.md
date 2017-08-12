Groestlcoin single node public testnet
--------------------------------------

- Node
  - RPC Port 15001, Username: user, Password: pass

To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 15001:15001 oweichhold/groestlcoin-public-testnet
```

Example RPC:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:15001/
```
