# AUTO GENERATED FILE - DO NOT EDIT

export dsc_dashsolanacomponents

"""
    dsc_dashsolanacomponents(;kwargs...)

A DashSolanaComponents component.

Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `network` (a value equal to: 'devnet', 'mainnet', 'testnet'; required)
"""
function dsc_dashsolanacomponents(; kwargs...)
        available_props = Symbol[:id, :network]
        wild_props = Symbol[]
        return Component("dsc_dashsolanacomponents", "DashSolanaComponents", "dash_solana_components", available_props, wild_props; kwargs...)
end

