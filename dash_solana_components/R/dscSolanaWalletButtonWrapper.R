# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSolanaWalletButtonWrapper <- function(children=NULL, id=NULL, className=NULL, rpcEndpoint=NULL) {
    
    props <- list(children=children, id=id, className=className, rpcEndpoint=rpcEndpoint)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SolanaWalletButtonWrapper',
        namespace = 'dash_solana_components',
        propNames = c('children', 'id', 'className', 'rpcEndpoint'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
