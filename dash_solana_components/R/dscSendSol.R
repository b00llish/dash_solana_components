# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSendSol <- function(id=NULL, className=NULL) {
    
    props <- list(id=id, className=className)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SendSol',
        namespace = 'dash_solana_components',
        propNames = c('id', 'className'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
