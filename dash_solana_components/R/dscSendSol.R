# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dscSendSol <- function(id=NULL, className=NULL, connection=NULL, connectionErr=NULL, publicKey=NULL, sendSolTx=NULL, sendTransaction=NULL, setSendSolTx=NULL) {
    
    props <- list(id=id, className=className, connection=connection, connectionErr=connectionErr, publicKey=publicKey, sendSolTx=sendSolTx, sendTransaction=sendTransaction, setSendSolTx=setSendSolTx)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'SendSol',
        namespace = 'dash_solana_components',
        propNames = c('id', 'className', 'connection', 'connectionErr', 'publicKey', 'sendSolTx', 'sendTransaction', 'setSendSolTx'),
        package = 'dashSolanaComponents'
        )

    structure(component, class = c('dash_component', 'list'))
}
