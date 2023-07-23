# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSolanaWalletMultiButton <- function(id=NULL, network=NULL) {
    
    props <- list(id=id, network=network)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SolanaWalletMultiButton',
        namespace = 'dash_solana_components',
        propNames = c('id', 'network'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
