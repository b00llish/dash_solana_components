# AUTO GENERATED FILE - DO NOT EDIT

export dsc_walletcontextprovider

"""
    dsc_walletcontextprovider(;kwargs...)
    dsc_walletcontextprovider(children::Any;kwargs...)
    dsc_walletcontextprovider(children_maker::Function;kwargs...)


A WalletContextProvider component.
Wallet Context Provider.
This is a wrapper for apps that provides wallet context throughout the app.
It must be used at the root of the app to provide wallet connections to all child components.
Keyword arguments:
- `children` (a list of or a singular dash component, string or number; required): Content
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `network` (a value equal to: 'devnet', 'mainnet', 'testnet'; required): The network for the wallet.

This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.
- `rpcEndpoint` (String; optional): The custom RPC endpoint for the wallet.

This prop specifies a custom RPC endpoint for the wallet. If it's not provided,
the default endpoint for the specified network will be used.
"""
function dsc_walletcontextprovider(; kwargs...)
        available_props = Symbol[:children, :id, :className, :network, :rpcEndpoint]
        wild_props = Symbol[]
        return Component("dsc_walletcontextprovider", "WalletContextProvider", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_walletcontextprovider(children::Any; kwargs...) = dsc_walletcontextprovider(;kwargs..., children = children)
dsc_walletcontextprovider(children_maker::Function; kwargs...) = dsc_walletcontextprovider(children_maker(); kwargs...)

