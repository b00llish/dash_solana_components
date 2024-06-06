# AUTO GENERATED FILE - DO NOT EDIT

export dsc_walletcontextprovider

"""
    dsc_walletcontextprovider(;kwargs...)
    dsc_walletcontextprovider(children::Any;kwargs...)
    dsc_walletcontextprovider(children_maker::Function;kwargs...)


A WalletContextProvider component.

Keyword arguments:
- `children` (a list of or a singular dash component, string or number; required)
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `network` (a value equal to: 'mainnet-beta', 'testnet', 'devnet'; optional)
- `rpcEndpoint` (String; optional)
"""
function dsc_walletcontextprovider(; kwargs...)
        available_props = Symbol[:children, :id, :className, :network, :rpcEndpoint]
        wild_props = Symbol[]
        return Component("dsc_walletcontextprovider", "WalletContextProvider", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_walletcontextprovider(children::Any; kwargs...) = dsc_walletcontextprovider(;kwargs..., children = children)
dsc_walletcontextprovider(children_maker::Function; kwargs...) = dsc_walletcontextprovider(children_maker(); kwargs...)

