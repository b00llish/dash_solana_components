% Auto-generated: do not edit by hand
\name{dscSolanaWalletMultiButton}

\alias{dscSolanaWalletMultiButton}

\title{SolanaWalletMultiButton component}

\description{
SolanaWalletMultiButton component. This is a multi-button component for Solana wallets. It allows users to connect to different types of Solana wallets.ne the SolanaWalletMultiButton compone is a functional component that takes some props and returns a JSX eleme
}

\usage{
dscSolanaWalletMultiButton(id=NULL, className=NULL, network=NULL, publicKeyState=NULL,
rpcEndpoint=NULL)
}

\arguments{
\item{id}{Character. Unique ID to identify this component in Dash callbacks.}

\item{className}{Character. CSS class name(s)

This prop can be used to apply one or more CSS classes to the button.
This makes it easy to customize the appearance of the button using CSS.}

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

