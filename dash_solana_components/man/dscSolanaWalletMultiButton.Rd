% Auto-generated: do not edit by hand
\name{dscSolanaWalletMultiButton}

\alias{dscSolanaWalletMultiButton}

\title{SolanaWalletMultiButton component}

\description{
SolanaWalletMultiButton. Requires use of the WalletContextProvider to provide wallet connections.
}

\usage{
dscSolanaWalletMultiButton(id=NULL, className=NULL, network=NULL, publicKeyState=NULL,
rpcEndpoint=NULL)
}

\arguments{
\item{id}{Character. Unique ID to identify this component in Dash callbacks.}

\item{className}{Character. Adds CSS class name(s).}

\item{network}{A value equal to: 'devnet', 'mainnet', 'testnet'. The network for the wallet.

This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.}

\item{publicKeyState}{Character. The state of the public key.

This prop holds the state of the public key. It could be a string representing
the public key, or null if there is no public key.}

\item{rpcEndpoint}{Character. The custom RPC endpoint for the wallet.

This prop specifies a custom RPC endpoint for the wallet. If it's not provided,
the default endpoint for the specified network will be used.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

