% Auto-generated: do not edit by hand
\name{dscSendSol}

\alias{dscSendSol}

\title{SendSol component}

\description{
SendSolTx component for sending Solana tokens. @param {SendSolTxProps} props - The properties for the component. @returns {JSX.Element} The rendered component.
}

\usage{
dscSendSol(id=NULL, className=NULL, connection=NULL,
connectionErr=NULL, publicKey=NULL, sendSolTx=NULL,
sendTransaction=NULL, setSendSolTx=NULL)
}

\arguments{
\item{id}{Character. Unique ID to identify this component in Dash callbacks.}

\item{className}{Character. Adds CSS class name(s).}

\item{connection}{Lists containing elements 'commitment', 'rpcendpoint', 'getbalanceandcontext', 'getbalance', 'getblocktime', 'getminimumledgerslot', 'getfirstavailableblock', 'getsupply', 'gettokensupply', 'gettokenaccountbalance', 'gettokenaccountsbyowner', 'getparsedtokenaccountsbyowner', 'getlargestaccounts', 'gettokenlargestaccounts', 'getaccountinfoandcontext', 'getparsedaccountinfo', 'getaccountinfo', 'getmultipleparsedaccounts', 'getmultipleaccountsinfoandcontext', 'getmultipleaccountsinfo', 'getstakeactivation', 'getprogramaccounts', 'getparsedprogramaccounts', 'confirmtransaction', 'getcancellationpromise', 'gettransactionconfirmationpromise', 'confirmtransactionusingblockheightexceedancestrategy', 'confirmtransactionusingdurablenoncestrategy', 'confirmtransactionusinglegacytimeoutstrategy', 'getclusternodes', 'getvoteaccounts', 'getslot', 'getslotleader', 'getslotleaders', 'getsignaturestatus', 'getsignaturestatuses', 'gettransactioncount', 'gettotalsupply', 'getinflationgovernor', 'getinflationreward', 'getinflationrate', 'getepochinfo', 'getepochschedule', 'getleaderschedule', 'getminimumbalanceforrentexemption', 'getrecentblockhashandcontext', 'getrecentperformancesamples', 'getfeecalculatorforblockhash', 'getfeeformessage', 'getrecentprioritizationfees', 'getrecentblockhash', 'getlatestblockhash', 'getlatestblockhashandcontext', 'isblockhashvalid', 'getversion', 'getgenesishash', 'getblock', 'getparsedblock', 'getblockheight', 'getblockproduction', 'gettransaction', 'getparsedtransaction', 'getparsedtransactions', 'gettransactions', 'getconfirmedblock', 'getblocks', 'getblocksignatures', 'getconfirmedblocksignatures', 'getconfirmedtransaction', 'getparsedconfirmedtransaction', 'getparsedconfirmedtransactions', 'getconfirmedsignaturesforaddress', 'getconfirmedsignaturesforaddress2', 'getsignaturesforaddress', 'getaddresslookuptable', 'getnonceandcontext', 'getnonce', 'requestairdrop', 'getstakeminimumdelegation', 'simulatetransaction', 'sendtransaction', 'sendrawtransaction', 'sendencodedtransaction', 'onaccountchange', 'removeaccountchangelistener', 'onprogramaccountchange', 'removeprogramaccountchangelistener', 'onlogs', 'removeonlogslistener', 'onslotchange', 'removeslotchangelistener', 'onslotupdate', 'removeslotupdatelistener', '_buildargs', 'onsignature', 'onsignaturewithoptions', 'removesignaturelistener', 'onrootchange', 'removerootchangelistener'.
those elements have the following types:
  - commitment (a value equal to: 'processed', 'confirmed', 'finalized', 'recent', 'single', 'singlegossip', 'root', 'max'; required): the default commitment used for requests
  - rpcendpoint (character; required): the rpc endpoint
  - getbalanceandcontext (required): fetch the balance for the specified public key, return with context
  - getbalance (required): fetch the balance for the specified public key
  - getblocktime (required): fetch the estimated production time of a block
  - getminimumledgerslot (required): fetch the lowest slot that the node has information about in its ledger.
this value may increase over time if the node is configured to purge older ledger data
  - getfirstavailableblock (required): fetch the slot of the lowest confirmed block that has not been purged from the ledger
  - getsupply (required): fetch information about the current supply
  - gettokensupply (required): fetch the current supply of a token mint
  - gettokenaccountbalance (required): fetch the current balance of a token account
  - gettokenaccountsbyowner (required): fetch all the token accounts owned by the specified account
@,return
  - getparsedtokenaccountsbyowner (required): fetch parsed token accounts owned by the specified account
@,return
  - getlargestaccounts (required): fetch the 20 largest accounts with their current balances
  - gettokenlargestaccounts (required): fetch the 20 largest token accounts with their current balances
for a given mint.
  - getaccountinfoandcontext (required): fetch all the account info for the specified public key, return with context
  - getparsedaccountinfo (required): fetch parsed account info for the specified public key
  - getaccountinfo (required): fetch all the account info for the specified public key
  - getmultipleparsedaccounts (required): fetch all the account info for multiple accounts specified by an array of public keys, return with context
  - getmultipleaccountsinfoandcontext (required): fetch all the account info for multiple accounts specified by an array of public keys, return with context
  - getmultipleaccountsinfo (required): fetch all the account info for multiple accounts specified by an array of public keys
  - getstakeactivation (required): returns epoch activation information for a stake account that has been delegated
  - getprogramaccounts (required): fetch all the accounts owned by the specified program id
@,return. getprogramaccounts has the following type: lists containing elements .
those elements have the following types:

  - getparsedprogramaccounts (required): fetch and parse all the accounts owned by the specified program id
@,return
  - confirmtransaction (required): . confirmtransaction has the following type: lists containing elements .
those elements have the following types:

  - getcancellationpromise (logical | numeric | character | named list | unnamed list; required)
  - gettransactionconfirmationpromise (logical | numeric | character | named list | unnamed list; required)
  - confirmtransactionusingblockheightexceedancestrategy (logical | numeric | character | named list | unnamed list; required)
  - confirmtransactionusingdurablenoncestrategy (logical | numeric | character | named list | unnamed list; required)
  - confirmtransactionusinglegacytimeoutstrategy (logical | numeric | character | named list | unnamed list; required)
  - getclusternodes (required): return the list of nodes that are currently participating in the cluster
  - getvoteaccounts (required): return the list of nodes that are currently participating in the cluster
  - getslot (required): fetch the current slot that the node is processing
  - getslotleader (required): fetch the current slot leader of the cluster
  - getslotleaders (required): fetch `limit` number of slot leaders starting from `startslot`
@,param,startslot, ,fetch slot leaders starting from this slot
@,param,limit, ,number of slot leaders to return
  - getsignaturestatus (required): fetch the current status of a signature
  - getsignaturestatuses (required): fetch the current statuses of a batch of signatures
  - gettransactioncount (required): fetch the current transaction count of the cluster
  - gettotalsupply (required): fetch the current total currency supply of the cluster in lamports
@,deprecated,deprecated since v1.2.8. please use ,{@link ,getsupply ,}, instead.
  - getinflationgovernor (required): fetch the cluster inflationgovernor parameters
  - getinflationreward (required): fetch the inflation reward for a list of addresses for an epoch
  - getinflationrate (required): fetch the specific inflation values for the current epoch
  - getepochinfo (required): fetch the epoch info parameters
  - getepochschedule (required): fetch the epoch schedule parameters
  - getleaderschedule (required): fetch the leader schedule for the current epoch
@,return
  - getminimumbalanceforrentexemption (required): fetch the minimum balance needed to exempt an account of `datalength`
size from rent
  - getrecentblockhashandcontext (required): fetch a recent blockhash from the cluster, return with context
@,return
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getlatestblockhash ,}, instead.
  - getrecentperformancesamples (required): fetch recent performance samples
@,return
  - getfeecalculatorforblockhash (required): fetch the fee calculator for a recent blockhash from the cluster, return with context
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getfeeformessage ,}, instead.
  - getfeeformessage (required): fetch the fee for a message from the cluster, return with context
  - getrecentprioritizationfees (required): fetch a list of prioritization fees from recent blocks.
  - getrecentblockhash (required): fetch a recent blockhash from the cluster
@,return
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getlatestblockhash ,}, instead.
  - getlatestblockhash (required): fetch the latest blockhash from the cluster
@,return
  - getlatestblockhashandcontext (required): fetch the latest blockhash from the cluster
@,return
  - isblockhashvalid (required): returns whether a blockhash is still valid or not
  - getversion (required): fetch the node version
  - getgenesishash (required): fetch the genesis hash
  - getblock (required): fetch a processed block from the cluster.
@,deprecated,instead, call `getblock` using a `getversionedblockconfig` by
setting the `maxsupportedtransactionversion` property.
@,deprecated,instead, call `getblock` using a `getversionedblockconfig` by
setting the `maxsupportedtransactionversion` property.
@,deprecated,instead, call `getblock` using a `getversionedblockconfig` by
setting the `maxsupportedtransactionversion` property.. getblock has the following type: lists containing elements .
those elements have the following types:

  - getparsedblock (required): fetch parsed transaction details for a confirmed or finalized block. getparsedblock has the following type: lists containing elements .
those elements have the following types:

  - getblockheight (required)
  - getblockproduction (required)
  - gettransaction (required): fetch a confirmed or finalized transaction from the cluster.
@,deprecated,instead, call `gettransaction` using a
`getversionedtransactionconfig` by setting the
`maxsupportedtransactionversion` property.. gettransaction has the following type: lists containing elements .
those elements have the following types:

  - getparsedtransaction (required): fetch parsed transaction details for a confirmed or finalized transaction
  - getparsedtransactions (required): fetch parsed transaction details for a batch of confirmed transactions
  - gettransactions (required): fetch transaction details for a batch of confirmed transactions.
similar to 
{@link 
getparsedtransactions 
}
 but returns a 
{@link 
transactionresponse 
}
.


fetch transaction details for a batch of confirmed transactions.
similar to 
{@link 
getparsedtransactions 
}
 but returns a 
{@link 
* versionedtransactionresponse
}
.
@,deprecated,instead, call `gettransactions` using a
`getversionedtransactionconfig` by setting the
`maxsupportedtransactionversion` property.. gettransactions has the following type: lists containing elements .
those elements have the following types:

  - getconfirmedblock (required): fetch a list of transactions and transaction statuses from the cluster
for a confirmed block.
@,deprecated,deprecated since v1.13.0. please use ,{@link ,getblock ,}, instead.
  - getblocks (required): fetch confirmed blocks between two slots
  - getblocksignatures (required): fetch a list of signatures from the cluster for a block, excluding rewards
  - getconfirmedblocksignatures (required): fetch a list of signatures from the cluster for a confirmed block, excluding rewards
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getblocksignatures ,}, instead.
  - getconfirmedtransaction (required): fetch a transaction details for a confirmed transaction
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,gettransaction ,}, instead.
  - getparsedconfirmedtransaction (required): fetch parsed transaction details for a confirmed transaction
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getparsedtransaction ,}, instead.
  - getparsedconfirmedtransactions (required): fetch parsed transaction details for a batch of confirmed transactions
@,deprecated,deprecated since solana v1.8.0. please use ,{@link ,getparsedtransactions ,}, instead.
  - getconfirmedsignaturesforaddress (required): fetch a list of all the confirmed signatures for transactions involving an address
within a specified slot range. max range allowed is 10,000 slots.
@,deprecated,deprecated since v1.3. please use ,{@link ,getconfirmedsignaturesforaddress2 ,}, instead.
@,param,address, ,queried address
@,param,startslot, ,start slot, inclusive
@,param,endslot, ,end slot, inclusive
  - getconfirmedsignaturesforaddress2 (required): returns confirmed signatures for transactions involving an
address backwards in time from the provided signature or most recent confirmed block
@,param,address, ,queried address
@,param,options
  - getsignaturesforaddress (required): returns confirmed signatures for transactions involving an
address backwards in time from the provided signature or most recent confirmed block
@,param,address, ,queried address
@,param,options
  - getaddresslookuptable (required)
  - getnonceandcontext (required): fetch the contents of a nonce account from the cluster, return with context
  - getnonce (required): fetch the contents of a nonce account from the cluster
  - requestairdrop (required): request an allocation of lamports to the specified address

```typescript
import { connection, publickey, lamports_per_sol } from "@solana/web3.js";

(async () => {
  const connection = new connection("https://api.testnet.solana.com", "confirmed");
  const myaddress = new publickey("2nr1bhft86w9tgnyvmyw4vchksqb3svqfnddasz4kexm");
  const signature = await connection.requestairdrop(myaddress, lamports_per_sol);
  await connection.confirmtransaction(signature);
})();
```
  - getstakeminimumdelegation (required): get the stake minimum delegation
  - simulatetransaction (required): simulate a transaction
@,deprecated,instead, call ,{@link ,simulatetransaction ,}, with ,{@link ,* versionedtransaction,}, and ,{@link ,simulatetransactionconfig ,}, parameters. simulatetransaction has the following type: lists containing elements .
those elements have the following types:

  - sendtransaction (required): sign and send a transaction


send a signed transaction
@,deprecated,instead, call ,{@link ,sendtransaction ,}, with a ,{@link ,* versionedtransaction,}. sendtransaction has the following type: lists containing elements .
those elements have the following types:

  - sendrawtransaction (required): send a transaction that has already been signed and serialized into the
wire format
  - sendencodedtransaction (required): send a transaction that has already been signed, serialized into the
wire format, and encoded as a base64 string
  - onaccountchange (required): register a callback to be invoked whenever the specified account changes
@,param,publickey, ,public key of the account to monitor
@,param,callback, ,function to invoke whenever the account is changed
@,param,commitment, ,specify the commitment level account changes must reach before notification
@,return,subscription id
  - removeaccountchangelistener (required): deregister an account notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister
  - onprogramaccountchange (required): register a callback to be invoked whenever accounts owned by the
specified program change
@,param,programid, ,public key of the program to monitor
@,param,callback, ,function to invoke whenever the account is changed
@,param,commitment, ,specify the commitment level account changes must reach before notification
@,param,filters, ,the program account filters to pass into the rpc method
@,return,subscription id
  - removeprogramaccountchangelistener (required): deregister an account notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister
  - onlogs (required): registers a callback to be invoked whenever logs are emitted.
  - removeonlogslistener (required): deregister a logs callback.
@,param,clientsubscriptionid, ,client subscription id to deregister.
  - onslotchange (required): register a callback to be invoked upon slot changes
@,param,callback, ,function to invoke whenever the slot changes
@,return,subscription id
  - removeslotchangelistener (required): deregister a slot notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister
  - onslotupdate (required): register a callback to be invoked upon slot updates. 
{@link 
slotupdate 
}
's
may be useful to track live progress of a cluster.
@,param,callback, ,function to invoke whenever the slot updates
@,return,subscription id
  - removeslotupdatelistener (required): deregister a slot update notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister
  - _buildargs (required)
  - onsignature (required): register a callback to be invoked upon signature updates
@,param,signature, ,transaction signature string in base 58
@,param,callback, ,function to invoke on signature notifications
@,param,commitment, ,specify the commitment level signature must reach before notification
@,return,subscription id
  - onsignaturewithoptions (required): register a callback to be invoked when a transaction is
received and/or processed.
@,param,signature, ,transaction signature string in base 58
@,param,callback, ,function to invoke on signature notifications
@,param,options, ,enable received notifications and set the commitment
level that signature must reach before notification
@,return,subscription id
  - removesignaturelistener (required): deregister a signature notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister
  - onrootchange (required): register a callback to be invoked upon root changes
@,param,callback, ,function to invoke whenever the root changes
@,return,subscription id
  - removerootchangelistener (required): deregister a root notification callback
@,param,clientsubscriptionid, ,client subscription id to deregister. Connection element for wallet.}

\item{connectionErr}{}

\item{publicKey}{Lists containing elements 'equals', 'tobase58', 'tojson', 'tobytes', 'tobuffer', 'tostring', '__@tostringtag@858', 'encode'.
those elements have the following types:
  - equals (required): checks if two publickeys are equal
  - tobase58 (required): return the base-58 representation of the public key
  - tojson (required)
  - tobytes (required): return the byte array representation of the public key in big endian
  - tobuffer (required): return the buffer representation of the public key in big endian
  - tostring (optional): return the base-58 representation of the public key
  - __@tostringtag@858 (character; required)
  - encode (required). Public key element for wallet.}

\item{sendSolTx}{Character. Transaction signature.}

\item{sendTransaction}{}

\item{setSendSolTx}{}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

