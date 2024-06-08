# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscTransactionButtonWrapper <- function(children=NULL, id=NULL, className=NULL, onTransactionSent=NULL, transactionInstructions=NULL) {
    
    props <- list(children=children, id=id, className=className, onTransactionSent=onTransactionSent, transactionInstructions=transactionInstructions)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'TransactionButtonWrapper',
        namespace = 'dash_solana_components',
        propNames = c('children', 'id', 'className', 'onTransactionSent', 'transactionInstructions'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
