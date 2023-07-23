import dash
import dash_solana_components as dsc


app = dash.Dash(__name__)

app.layout = dsc.SolanaWalletMultiButton(id='component', network='mainnet')

if __name__ == '__main__':
    app.run_server(debug=True)
