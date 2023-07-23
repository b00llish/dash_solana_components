# AUTO GENERATED FILE - DO NOT EDIT

export dsc_solanawalletmultibutton

"""
    dsc_solanawalletmultibutton(;kwargs...)

A SolanaWalletMultiButton component.

Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `network` (a value equal to: 'devnet', 'mainnet', 'testnet'; optional)
"""
function dsc_solanawalletmultibutton(; kwargs...)
        available_props = Symbol[:id, :network]
        wild_props = Symbol[]
        return Component("dsc_solanawalletmultibutton", "SolanaWalletMultiButton", "dash_solana_components", available_props, wild_props; kwargs...)
end

