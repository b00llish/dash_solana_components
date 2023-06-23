import dash_solana_components as dsc
import dash

app = dash.Dash(__name__)

app.layout = dsc.DashSolanaComponents(id='component')
# app.layout = dsc.App(id='component')

if __name__ == '__main__':
    app.run_server(debug=True)
