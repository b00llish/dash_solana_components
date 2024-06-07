# AUTO GENERATED FILE - DO NOT EDIT

export dsc_sendsol

"""
    dsc_sendsol(;kwargs...)

A SendSol component.

Keyword arguments:
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
"""
function dsc_sendsol(; kwargs...)
        available_props = Symbol[:id, :className]
        wild_props = Symbol[]
        return Component("dsc_sendsol", "SendSol", "dash_solana_components", available_props, wild_props; kwargs...)
end

