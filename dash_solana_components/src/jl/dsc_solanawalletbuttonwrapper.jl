# AUTO GENERATED FILE - DO NOT EDIT

export dsc_solanawalletbuttonwrapper

"""
    dsc_solanawalletbuttonwrapper(;kwargs...)
    dsc_solanawalletbuttonwrapper(children::Any;kwargs...)
    dsc_solanawalletbuttonwrapper(children_maker::Function;kwargs...)


A SolanaWalletButtonWrapper component.

Keyword arguments:
- `children` (a list of or a singular dash component, string or number; optional): The child components to be rendered inside the wrapper.
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `rpcEndpoint` (String; optional): The custom RPC endpoint for the wallet.
If it's not provided, the default endpoint for the specified network will be used.
"""
function dsc_solanawalletbuttonwrapper(; kwargs...)
        available_props = Symbol[:children, :id, :className, :rpcEndpoint]
        wild_props = Symbol[]
        return Component("dsc_solanawalletbuttonwrapper", "SolanaWalletButtonWrapper", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_solanawalletbuttonwrapper(children::Any; kwargs...) = dsc_solanawalletbuttonwrapper(;kwargs..., children = children)
dsc_solanawalletbuttonwrapper(children_maker::Function; kwargs...) = dsc_solanawalletbuttonwrapper(children_maker(); kwargs...)

