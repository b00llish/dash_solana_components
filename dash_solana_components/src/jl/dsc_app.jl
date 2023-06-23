# AUTO GENERATED FILE - DO NOT EDIT

export dsc_app

"""
    dsc_app(;kwargs...)

An App component.

Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `network` (a value equal to: 'devnet', 'mainnet', 'testnet'; required)
"""
function dsc_app(; kwargs...)
        available_props = Symbol[:id, :network]
        wild_props = Symbol[]
        return Component("dsc_app", "App", "dash_solana_components", available_props, wild_props; kwargs...)
end

