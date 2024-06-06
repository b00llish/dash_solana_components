% Auto-generated: do not edit by hand
\name{dscWalletContextProvider}

\alias{dscWalletContextProvider}

\title{WalletContextProvider component}

\description{
Wallet Context Provider. This is a wrapper for apps that provides wallet context throughout the app. It must be used at the root of the app to provide wallet connections to all child components.
}

\usage{
dscWalletContextProvider(children=NULL, id=NULL, className=NULL, network=NULL,
rpcEndpoint=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. Content}

\item{id}{Character. Unique ID to identify this component in Dash callbacks.}

\item{className}{Character. Adds CSS class name(s).}

\item{network}{A value equal to: 'devnet', 'mainnet', 'testnet'. The network for the wallet.

This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.}

\item{rpcEndpoint}{Character. The custom RPC endpoint for the wallet.

This prop specifies a custom RPC endpoint for the wallet. If it's not provided,
the default endpoint for the specified network will be used.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

