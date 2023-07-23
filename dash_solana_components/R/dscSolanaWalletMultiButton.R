# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSolanaWalletMultiButton <- function(id=NULL, className=NULL, network=NULL, publicKeyState=NULL, rpcEndpoint=NULL) {
    
    props <- list(id=id, className=className, network=network, publicKeyState=publicKeyState, rpcEndpoint=rpcEndpoint)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SolanaWalletMultiButton',
        namespace = 'dash_solana_components',
        propNames = c('id', 'className', 'network', 'publicKeyState', 'rpcEndpoint'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
