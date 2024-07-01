# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSolanaWalletMultiButton <- function(children=NULL, id=NULL, className=NULL, disabled=NULL, endIcon=NULL, network=NULL, onClick=NULL, publicKeyState=NULL, rpcEndpoint=NULL, startIcon=NULL, style=NULL, tabIndex=NULL) {
    
    props <- list(children=children, id=id, className=className, disabled=disabled, endIcon=endIcon, network=network, onClick=onClick, publicKeyState=publicKeyState, rpcEndpoint=rpcEndpoint, startIcon=startIcon, style=style, tabIndex=tabIndex)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SolanaWalletMultiButton',
        namespace = 'dash_solana_components',
        propNames = c('children', 'id', 'className', 'disabled', 'endIcon', 'network', 'onClick', 'publicKeyState', 'rpcEndpoint', 'startIcon', 'style', 'tabIndex'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
