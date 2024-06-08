# AUTO GENERATED FILE - DO NOT EDIT

export dsc_transactionbuttonwrapper

"""
    dsc_transactionbuttonwrapper(;kwargs...)
    dsc_transactionbuttonwrapper(children::Any;kwargs...)
    dsc_transactionbuttonwrapper(children_maker::Function;kwargs...)


A TransactionButtonWrapper component.

Keyword arguments:
- `children` (a list of or a singular dash component, string or number; required)
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `transactionInstructions` (Array of Strings; required)
"""
function dsc_transactionbuttonwrapper(; kwargs...)
        available_props = Symbol[:children, :id, :className, :transactionInstructions]
        wild_props = Symbol[]
        return Component("dsc_transactionbuttonwrapper", "TransactionButtonWrapper", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_transactionbuttonwrapper(children::Any; kwargs...) = dsc_transactionbuttonwrapper(;kwargs..., children = children)
dsc_transactionbuttonwrapper(children_maker::Function; kwargs...) = dsc_transactionbuttonwrapper(children_maker(); kwargs...)

