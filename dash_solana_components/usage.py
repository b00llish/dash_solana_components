import dash_solana_components
import dash

app = dash.Dash(__name__)

app.layout = dash_solana_components.DashSolanaComponents(id='component')


if __name__ == '__main__':
    app.run_server(debug=True)
