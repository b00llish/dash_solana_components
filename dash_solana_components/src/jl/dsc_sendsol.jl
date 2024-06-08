# AUTO GENERATED FILE - DO NOT EDIT

export dsc_sendsol

"""
    dsc_sendsol(;kwargs...)

A SendSol component.
SendSolTx component for sending Solana tokens.
@param {SendSolTxProps} props - The properties for the component.
@returns {JSX.Element} The rendered component.
Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `connection` (required): Connection element for wallet.. connection has the following type: lists containing elements 'commitment', 'rpcEndpoint', 'getBalanceAndContext', 'getBalance', 'getBlockTime', 'getMinimumLedgerSlot', 'getFirstAvailableBlock', 'getSupply', 'getTokenSupply', 'getTokenAccountBalance', 'getTokenAccountsByOwner', 'getParsedTokenAccountsByOwner', 'getLargestAccounts', 'getTokenLargestAccounts', 'getAccountInfoAndContext', 'getParsedAccountInfo', 'getAccountInfo', 'getMultipleParsedAccounts', 'getMultipleAccountsInfoAndContext', 'getMultipleAccountsInfo', 'getStakeActivation', 'getProgramAccounts', 'getParsedProgramAccounts', 'confirmTransaction', 'getCancellationPromise', 'getTransactionConfirmationPromise', 'confirmTransactionUsingBlockHeightExceedanceStrategy', 'confirmTransactionUsingDurableNonceStrategy', 'confirmTransactionUsingLegacyTimeoutStrategy', 'getClusterNodes', 'getVoteAccounts', 'getSlot', 'getSlotLeader', 'getSlotLeaders', 'getSignatureStatus', 'getSignatureStatuses', 'getTransactionCount', 'getTotalSupply', 'getInflationGovernor', 'getInflationReward', 'getInflationRate', 'getEpochInfo', 'getEpochSchedule', 'getLeaderSchedule', 'getMinimumBalanceForRentExemption', 'getRecentBlockhashAndContext', 'getRecentPerformanceSamples', 'getFeeCalculatorForBlockhash', 'getFeeForMessage', 'getRecentPrioritizationFees', 'getRecentBlockhash', 'getLatestBlockhash', 'getLatestBlockhashAndContext', 'isBlockhashValid', 'getVersion', 'getGenesisHash', 'getBlock', 'getParsedBlock', 'getBlockHeight', 'getBlockProduction', 'getTransaction', 'getParsedTransaction', 'getParsedTransactions', 'getTransactions', 'getConfirmedBlock', 'getBlocks', 'getBlockSignatures', 'getConfirmedBlockSignatures', 'getConfirmedTransaction', 'getParsedConfirmedTransaction', 'getParsedConfirmedTransactions', 'getConfirmedSignaturesForAddress', 'getConfirmedSignaturesForAddress2', 'getSignaturesForAddress', 'getAddressLookupTable', 'getNonceAndContext', 'getNonce', 'requestAirdrop', 'getStakeMinimumDelegation', 'simulateTransaction', 'sendTransaction', 'sendRawTransaction', 'sendEncodedTransaction', 'onAccountChange', 'removeAccountChangeListener', 'onProgramAccountChange', 'removeProgramAccountChangeListener', 'onLogs', 'removeOnLogsListener', 'onSlotChange', 'removeSlotChangeListener', 'onSlotUpdate', 'removeSlotUpdateListener', '_buildArgs', 'onSignature', 'onSignatureWithOptions', 'removeSignatureListener', 'onRootChange', 'removeRootChangeListener'.
Those elements have the following types:
  - `commitment` (a value equal to: 'processed', 'confirmed', 'finalized', 'recent', 'single', 'singleGossip', 'root', 'max'; required): The default commitment used for requests
  - `rpcEndpoint` (String; required): The RPC endpoint
  - `getBalanceAndContext` (required): Fetch the balance for the specified public key, return with context
  - `getBalance` (required): Fetch the balance for the specified public key
  - `getBlockTime` (required): Fetch the estimated production time of a block
  - `getMinimumLedgerSlot` (required): Fetch the lowest slot that the node has information about in its ledger.
This value may increase over time if the node is configured to purge older ledger data
  - `getFirstAvailableBlock` (required): Fetch the slot of the lowest confirmed block that has not been purged from the ledger
  - `getSupply` (required): Fetch information about the current supply
  - `getTokenSupply` (required): Fetch the current supply of a token mint
  - `getTokenAccountBalance` (required): Fetch the current balance of a token account
  - `getTokenAccountsByOwner` (required): Fetch all the token accounts owned by the specified account
@,return
  - `getParsedTokenAccountsByOwner` (required): Fetch parsed token accounts owned by the specified account
@,return
  - `getLargestAccounts` (required): Fetch the 20 largest accounts with their current balances
  - `getTokenLargestAccounts` (required): Fetch the 20 largest token accounts with their current balances
for a given mint.
  - `getAccountInfoAndContext` (required): Fetch all the account info for the specified public key, return with context
  - `getParsedAccountInfo` (required): Fetch parsed account info for the specified public key
  - `getAccountInfo` (required): Fetch all the account info for the specified public key
  - `getMultipleParsedAccounts` (required): Fetch all the account info for multiple accounts specified by an array of public keys, return with context
  - `getMultipleAccountsInfoAndContext` (required): Fetch all the account info for multiple accounts specified by an array of public keys, return with context
  - `getMultipleAccountsInfo` (required): Fetch all the account info for multiple accounts specified by an array of public keys
  - `getStakeActivation` (required): Returns epoch activation information for a stake account that has been delegated
  - `getProgramAccounts` (required): Fetch all the accounts owned by the specified program id
@,return. getProgramAccounts has the following type: lists containing elements .
Those elements have the following types:

  - `getParsedProgramAccounts` (required): Fetch and parse all the accounts owned by the specified program id
@,return
  - `confirmTransaction` (required): . confirmTransaction has the following type: lists containing elements .
Those elements have the following types:

  - `getCancellationPromise` (Bool | Real | String | Dict | Array; required)
  - `getTransactionConfirmationPromise` (Bool | Real | String | Dict | Array; required)
  - `confirmTransactionUsingBlockHeightExceedanceStrategy` (Bool | Real | String | Dict | Array; required)
  - `confirmTransactionUsingDurableNonceStrategy` (Bool | Real | String | Dict | Array; required)
  - `confirmTransactionUsingLegacyTimeoutStrategy` (Bool | Real | String | Dict | Array; required)
  - `getClusterNodes` (required): Return the list of nodes that are currently participating in the cluster
  - `getVoteAccounts` (required): Return the list of nodes that are currently participating in the cluster
  - `getSlot` (required): Fetch the current slot that the node is processing
  - `getSlotLeader` (required): Fetch the current slot leader of the cluster
  - `getSlotLeaders` (required): Fetch `limit` number of slot leaders starting from `startSlot`
@,param,startSlot, ,fetch slot leaders starting from this slot
@,param,limit, ,number of slot leaders to return
  - `getSignatureStatus` (required): Fetch the current status of a signature
  - `getSignatureStatuses` (required): Fetch the current statuses of a batch of signatures
  - `getTransactionCount` (required): Fetch the current transaction count of the cluster
  - `getTotalSupply` (required): Fetch the current total currency supply of the cluster in lamports
@,deprecated,Deprecated since v1.2.8. Please use ,{@link ,getSupply ,}, instead.
  - `getInflationGovernor` (required): Fetch the cluster InflationGovernor parameters
  - `getInflationReward` (required): Fetch the inflation reward for a list of addresses for an epoch
  - `getInflationRate` (required): Fetch the specific inflation values for the current epoch
  - `getEpochInfo` (required): Fetch the Epoch Info parameters
  - `getEpochSchedule` (required): Fetch the Epoch Schedule parameters
  - `getLeaderSchedule` (required): Fetch the leader schedule for the current epoch
@,return
  - `getMinimumBalanceForRentExemption` (required): Fetch the minimum balance needed to exempt an account of `dataLength`
size from rent
  - `getRecentBlockhashAndContext` (required): Fetch a recent blockhash from the cluster, return with context
@,return
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getLatestBlockhash ,}, instead.
  - `getRecentPerformanceSamples` (required): Fetch recent performance samples
@,return
  - `getFeeCalculatorForBlockhash` (required): Fetch the fee calculator for a recent blockhash from the cluster, return with context
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getFeeForMessage ,}, instead.
  - `getFeeForMessage` (required): Fetch the fee for a message from the cluster, return with context
  - `getRecentPrioritizationFees` (required): Fetch a list of prioritization fees from recent blocks.
  - `getRecentBlockhash` (required): Fetch a recent blockhash from the cluster
@,return
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getLatestBlockhash ,}, instead.
  - `getLatestBlockhash` (required): Fetch the latest blockhash from the cluster
@,return
  - `getLatestBlockhashAndContext` (required): Fetch the latest blockhash from the cluster
@,return
  - `isBlockhashValid` (required): Returns whether a blockhash is still valid or not
  - `getVersion` (required): Fetch the node version
  - `getGenesisHash` (required): Fetch the genesis hash
  - `getBlock` (required): Fetch a processed block from the cluster.
@,deprecated,Instead, call `getBlock` using a `GetVersionedBlockConfig` by
setting the `maxSupportedTransactionVersion` property.
@,deprecated,Instead, call `getBlock` using a `GetVersionedBlockConfig` by
setting the `maxSupportedTransactionVersion` property.
@,deprecated,Instead, call `getBlock` using a `GetVersionedBlockConfig` by
setting the `maxSupportedTransactionVersion` property.. getBlock has the following type: lists containing elements .
Those elements have the following types:

  - `getParsedBlock` (required): Fetch parsed transaction details for a confirmed or finalized block. getParsedBlock has the following type: lists containing elements .
Those elements have the following types:

  - `getBlockHeight` (required)
  - `getBlockProduction` (required)
  - `getTransaction` (required): Fetch a confirmed or finalized transaction from the cluster.
@,deprecated,Instead, call `getTransaction` using a
`GetVersionedTransactionConfig` by setting the
`maxSupportedTransactionVersion` property.. getTransaction has the following type: lists containing elements .
Those elements have the following types:

  - `getParsedTransaction` (required): Fetch parsed transaction details for a confirmed or finalized transaction
  - `getParsedTransactions` (required): Fetch parsed transaction details for a batch of confirmed transactions
  - `getTransactions` (required): Fetch transaction details for a batch of confirmed transactions.
Similar to 
{@link 
getParsedTransactions 
}
 but returns a 
{@link 
TransactionResponse 
}
.


Fetch transaction details for a batch of confirmed transactions.
Similar to 
{@link 
getParsedTransactions 
}
 but returns a 
{@link 
* VersionedTransactionResponse
}
.
@,deprecated,Instead, call `getTransactions` using a
`GetVersionedTransactionConfig` by setting the
`maxSupportedTransactionVersion` property.. getTransactions has the following type: lists containing elements .
Those elements have the following types:

  - `getConfirmedBlock` (required): Fetch a list of Transactions and transaction statuses from the cluster
for a confirmed block.
@,deprecated,Deprecated since v1.13.0. Please use ,{@link ,getBlock ,}, instead.
  - `getBlocks` (required): Fetch confirmed blocks between two slots
  - `getBlockSignatures` (required): Fetch a list of Signatures from the cluster for a block, excluding rewards
  - `getConfirmedBlockSignatures` (required): Fetch a list of Signatures from the cluster for a confirmed block, excluding rewards
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getBlockSignatures ,}, instead.
  - `getConfirmedTransaction` (required): Fetch a transaction details for a confirmed transaction
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getTransaction ,}, instead.
  - `getParsedConfirmedTransaction` (required): Fetch parsed transaction details for a confirmed transaction
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getParsedTransaction ,}, instead.
  - `getParsedConfirmedTransactions` (required): Fetch parsed transaction details for a batch of confirmed transactions
@,deprecated,Deprecated since Solana v1.8.0. Please use ,{@link ,getParsedTransactions ,}, instead.
  - `getConfirmedSignaturesForAddress` (required): Fetch a list of all the confirmed signatures for transactions involving an address
within a specified slot range. Max range allowed is 10,000 slots.
@,deprecated,Deprecated since v1.3. Please use ,{@link ,getConfirmedSignaturesForAddress2 ,}, instead.
@,param,address, ,queried address
@,param,startSlot, ,start slot, inclusive
@,param,endSlot, ,end slot, inclusive
  - `getConfirmedSignaturesForAddress2` (required): Returns confirmed signatures for transactions involving an
address backwards in time from the provided signature or most recent confirmed block
@,param,address, ,queried address
@,param,options
  - `getSignaturesForAddress` (required): Returns confirmed signatures for transactions involving an
address backwards in time from the provided signature or most recent confirmed block
@,param,address, ,queried address
@,param,options
  - `getAddressLookupTable` (required)
  - `getNonceAndContext` (required): Fetch the contents of a Nonce account from the cluster, return with context
  - `getNonce` (required): Fetch the contents of a Nonce account from the cluster
  - `requestAirdrop` (required): Request an allocation of lamports to the specified address

```typescript
import { Connection, PublicKey, LAMPORTS_PER_SOL } from "@solana/web3.js";

(async () => {
  const connection = new Connection("https://api.testnet.solana.com", "confirmed");
  const myAddress = new PublicKey("2nr1bHFT86W9tGnyvmYW4vcHKsQB3sVQfnddasz4kExM");
  const signature = await connection.requestAirdrop(myAddress, LAMPORTS_PER_SOL);
  await connection.confirmTransaction(signature);
})();
```
  - `getStakeMinimumDelegation` (required): get the stake minimum delegation
  - `simulateTransaction` (required): Simulate a transaction
@,deprecated,Instead, call ,{@link ,simulateTransaction ,}, with ,{@link ,* VersionedTransaction,}, and ,{@link ,SimulateTransactionConfig ,}, parameters. simulateTransaction has the following type: lists containing elements .
Those elements have the following types:

  - `sendTransaction` (required): Sign and send a transaction


Send a signed transaction
@,deprecated,Instead, call ,{@link ,sendTransaction ,}, with a ,{@link ,* VersionedTransaction,}. sendTransaction has the following type: lists containing elements .
Those elements have the following types:

  - `sendRawTransaction` (required): Send a transaction that has already been signed and serialized into the
wire format
  - `sendEncodedTransaction` (required): Send a transaction that has already been signed, serialized into the
wire format, and encoded as a base64 string
  - `onAccountChange` (required): Register a callback to be invoked whenever the specified account changes
@,param,publicKey, ,Public key of the account to monitor
@,param,callback, ,Function to invoke whenever the account is changed
@,param,commitment, ,Specify the commitment level account changes must reach before notification
@,return,subscription id
  - `removeAccountChangeListener` (required): Deregister an account notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
  - `onProgramAccountChange` (required): Register a callback to be invoked whenever accounts owned by the
specified program change
@,param,programId, ,Public key of the program to monitor
@,param,callback, ,Function to invoke whenever the account is changed
@,param,commitment, ,Specify the commitment level account changes must reach before notification
@,param,filters, ,The program account filters to pass into the RPC method
@,return,subscription id
  - `removeProgramAccountChangeListener` (required): Deregister an account notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
  - `onLogs` (required): Registers a callback to be invoked whenever logs are emitted.
  - `removeOnLogsListener` (required): Deregister a logs callback.
@,param,clientSubscriptionId, ,client subscription id to deregister.
  - `onSlotChange` (required): Register a callback to be invoked upon slot changes
@,param,callback, ,Function to invoke whenever the slot changes
@,return,subscription id
  - `removeSlotChangeListener` (required): Deregister a slot notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
  - `onSlotUpdate` (required): Register a callback to be invoked upon slot updates. 
{@link 
SlotUpdate 
}
's
may be useful to track live progress of a cluster.
@,param,callback, ,Function to invoke whenever the slot updates
@,return,subscription id
  - `removeSlotUpdateListener` (required): Deregister a slot update notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
  - `_buildArgs` (required)
  - `onSignature` (required): Register a callback to be invoked upon signature updates
@,param,signature, ,Transaction signature string in base 58
@,param,callback, ,Function to invoke on signature notifications
@,param,commitment, ,Specify the commitment level signature must reach before notification
@,return,subscription id
  - `onSignatureWithOptions` (required): Register a callback to be invoked when a transaction is
received and/or processed.
@,param,signature, ,Transaction signature string in base 58
@,param,callback, ,Function to invoke on signature notifications
@,param,options, ,Enable received notifications and set the commitment
level that signature must reach before notification
@,return,subscription id
  - `removeSignatureListener` (required): Deregister a signature notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
  - `onRootChange` (required): Register a callback to be invoked upon root changes
@,param,callback, ,Function to invoke whenever the root changes
@,return,subscription id
  - `removeRootChangeListener` (required): Deregister a root notification callback
@,param,clientSubscriptionId, ,client subscription id to deregister
- `publicKey` (required): Public key element for wallet.. publicKey has the following type: lists containing elements 'equals', 'toBase58', 'toJSON', 'toBytes', 'toBuffer', 'toString', '__@toStringTag@858', 'encode'.
Those elements have the following types:
  - `equals` (required): Checks if two publicKeys are equal
  - `toBase58` (required): Return the base-58 representation of the public key
  - `toJSON` (required)
  - `toBytes` (required): Return the byte array representation of the public key in big endian
  - `toBuffer` (required): Return the Buffer representation of the public key in big endian
  - `toString` (optional): Return the base-58 representation of the public key
  - `__@toStringTag@858` (String; required)
  - `encode` (required)
- `sendSolTx` (String; required): Transaction signature.
"""
function dsc_sendsol(; kwargs...)
        available_props = Symbol[:id, :className, :connection, :publicKey, :sendSolTx]
        wild_props = Symbol[]
        return Component("dsc_sendsol", "SendSol", "dash_solana_components", available_props, wild_props; kwargs...)
end

