# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscWalletContextProvider <- function(children=NULL, id=NULL, className=NULL, network=NULL, rpcEndpoint=NULL) {
    
    props <- list(children=children, id=id, className=className, network=network, rpcEndpoint=rpcEndpoint)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'WalletContextProvider',
        namespace = 'dash_solana_components',
        propNames = c('children', 'id', 'className', 'network', 'rpcEndpoint'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
