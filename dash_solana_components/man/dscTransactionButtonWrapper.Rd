% Auto-generated: do not edit by hand
\name{dscTransactionButtonWrapper}

\alias{dscTransactionButtonWrapper}

\title{TransactionButtonWrapper component}

\description{
A wrapper component for transaction buttons that handles Solana transaction instructions. @param {Object} props - The properties for the component. @param {string} props.id - The ID of the component. @param {string} props.className - The CSS class of the component. @param {function} props.setProps - Function to set properties. @param {React.ReactNode} props.children - The child components. @param {string[] | null} props.transactionInstructions - The transaction instructions in JSON format. @param {function(string): void} [props.onTransactionSent] - Callback function when the transaction is sent. @returns {JSX.Element} The rendered component.
}

\usage{
dscTransactionButtonWrapper(children=NULL, id=NULL, className=NULL,
transactionInstructions=NULL)
}

\arguments{
\item{children}{A list of or a singular dash component, string or number. The child components to be rendered inside the wrapper.}

\item{id}{Character. Unique ID to identify this component in Dash callbacks.}

\item{className}{Character. Adds CSS class name(s).}

\item{transactionInstructions}{List of characters. The transaction instructions in JSON format, or an empty list if none.}
}

\value{named list of JSON elements corresponding to React.js properties and their values}

