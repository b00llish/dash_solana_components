# AUTO GENERATED FILE - DO NOT EDIT

export dsc_solanawalletmultibutton

"""
    dsc_solanawalletmultibutton(;kwargs...)

A SolanaWalletMultiButton component.
SolanaWalletMultiButton.
Requires use of the WalletContextProvider to provide wallet connections.
Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `network` (a value equal to: 'devnet', 'mainnet', 'testnet'; optional): The network for the wallet.

This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.
- `publicKeyState` (String; optional): The state of the public key.

This prop holds the state of the public key. It could be a string representing
the public key, or null if there is no public key.
- `rpcEndpoint` (String; optional): The custom RPC endpoint for the wallet.

This prop specifies a custom RPC endpoint for the wallet. If it's not provided,
the default endpoint for the specified network will be used.
"""
function dsc_solanawalletmultibutton(; kwargs...)
        available_props = Symbol[:id, :className, :network, :publicKeyState, :rpcEndpoint]
        wild_props = Symbol[]
        return Component("dsc_solanawalletmultibutton", "SolanaWalletMultiButton", "dash_solana_components", available_props, wild_props; kwargs...)
end

