# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscDashSolanaComponents <- function(id=NULL) {
    
    props <- list(id=id)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DashSolanaComponents',
        namespace = 'dash_solana_components',
        propNames = c('id'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
