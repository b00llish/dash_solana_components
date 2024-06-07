import dash
from dash import dcc
from dash import html
import dash_solana_components as dsc
from dash.dependencies import Input, Output

app = dash.Dash(__name__)

helius_rpc = 'https://mainnet.helius-rpc.com/?api-key=0ef644d5-6254-4913-a106-0c1ce1b3b3cf'

app.layout = dsc.WalletContextProvider(
    id='wallet-context-provider',
    network='mainnet',
    rpcEndpoint=helius_rpc,
    children=html.Div(
        [
            html.Div(dsc.SolanaWalletMultiButton(id='solana-wallet', network='mainnet', rpcEndpoint=helius_rpc)),
            html.Div(id='public-key-display', children="Not connected."),
            html.Div(dsc.SendSol(id='send-sol')),
        ]
    )
)

@app.callback(
    Output('public-key-display', 'children'),
    Input('solana-wallet', 'publicKeyState'),
)
def update_public_key_display(public_key_state):
    if public_key_state is not None:
        return f"Public key: {public_key_state}"
    else:
        return "Not connected."

if __name__ == '__main__':
    app.run_server(debug=True)
