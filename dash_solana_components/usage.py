import dash
from dash import dcc
from dash import html
import dash_solana_components as dsc
from dash.dependencies import Input, Output

app = dash.Dash(__name__)

app.layout = html.Div([
    html.Div(dsc.SolanaWalletMultiButton(id='solana-wallet', network='mainnet')),
    html.Div(id='public-key-display', children="Not connected."),
])

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
