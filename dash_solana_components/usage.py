# usage.py
import dash
from dash import dcc, no_update
from dash import html
import dash_solana_components as dsc
from dash.dependencies import Input, Output, State
from solders.pubkey import Pubkey
from solders.system_program import TransferParams, transfer

app = dash.Dash(__name__)

LAMPORTS_PER_SOL = 1_000_000_000

def generate_transaction_instructions(public_key_state: str, to_public_key: str, amount: float):
    if public_key_state:
        amount_lamports = int(float(amount) *  LAMPORTS_PER_SOL) # Amount in lamports (1 SOL)
        instructions = transfer(
            TransferParams(
                from_pubkey=Pubkey.from_string(public_key_state),
                to_pubkey=Pubkey.from_string(to_public_key),
                lamports=amount_lamports
            )
        )
        print("transfer instructions:", instructions)
        output = [instructions.to_json()]  # Ensure the return value is a JSON string
        print("output:", output)
        return output
    return []


helius_rpc = 'https://mainnet.helius-rpc.com/?api-key=0ef644d5-6254-4913-a106-0c1ce1b3b3cf'

app.layout = dsc.WalletContextProvider(
    id='wallet-context-provider',
    network='mainnet',
    rpcEndpoint=helius_rpc,
    children=html.Div(
        [
            dcc.Interval(id='interval', interval=1000, max_intervals=1),
            html.Div(dsc.SolanaWalletMultiButton(
                id='solana-wallet',
                network='mainnet',
                rpcEndpoint=helius_rpc,
                # children=html.Button(
                #     # 'Connect wallet',
                #                      id='connect-wallet-button',
                #                     #  disabled=True,
                #                      style={
                #                             # "display": "flex",
                #                             "justifyContent": "center",
                #                             # "alignItems": "center",
                #                         }),
                )
                     ),
            html.Div(id='public-key-display', children="Not connected."),
            html.Div(children=[dcc.Input(id='amt-input-box', type='number', value='0.1', min=0, step=1/LAMPORTS_PER_SOL)]),
            html.Div(children=[dcc.Input(id='to-pubkey-input-box', type='text', value='FTZbJxyv3QPFMHfqdUaqVLDcNuhsVpGaSZGWiEaDqFDx')]),
            dsc.TransactionButtonWrapper(
                    id='transaction-button-wrapper',
                    children=html.Button('Send SOL', id='send-sol-button', disabled=True, style={
                                            "display": "flex",
                                            "justifyContent": "center",
                                            "alignItems": "center",
                                        }),
                    transactionInstructions=[],
            ),
            html.Div(id='transaction-signature-display', children="Transaction signature will appear here."),
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

@app.callback(
    Output('send-sol-button', 'disabled'),
    Input('interval', 'n_intervals'),
    State('amt-input-box', 'value'),
    State('to-pubkey-input-box', 'value'),
)
def manage_button_state(_, amt_input, public_key_state):
    if amt_input and public_key_state:
        return False
    return True
        

@app.callback(
    Output('transaction-button-wrapper', 'transactionInstructions'),
    Input('send-sol-button', 'n_clicks'),
    State('solana-wallet', 'publicKeyState'),
    State('amt-input-box', 'value'),
    State('to-pubkey-input-box', 'value'),
)
def update_transaction_data(n_clicks, public_key_state, amount, to_public_key):
    if n_clicks and public_key_state:
        return generate_transaction_instructions(
            public_key_state=public_key_state, 
            to_public_key=to_public_key,
            amount=amount,
            )
    return no_update

@app.callback(
    Output('transaction-signature-display', 'children'),
    Input('transaction-button-wrapper', 'transactionSignature'),
)
def display_transaction_signature(transaction_signature):
    if not transaction_signature:
        return no_update
    return f"Transaction signature: {transaction_signature}"

# todo: update signin message
# in actual app, may want to have a specific dcc store for the tx sig to ensure it doesn't get overwritten by an unintended refresh

if __name__ == '__main__':
    app.run_server(debug=True)
