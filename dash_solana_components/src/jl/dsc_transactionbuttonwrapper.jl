# AUTO GENERATED FILE - DO NOT EDIT

export dsc_transactionbuttonwrapper

"""
    dsc_transactionbuttonwrapper(;kwargs...)
    dsc_transactionbuttonwrapper(children::Any;kwargs...)
    dsc_transactionbuttonwrapper(children_maker::Function;kwargs...)


A TransactionButtonWrapper component.
A wrapper component for transaction buttons that handles Solana transaction instructions.
@param {Object} props - The properties for the component.
@param {string} props.id - The ID of the component.
@param {string} props.className - The CSS class of the component.
@param {function} props.setProps - Function to set properties.
@param {React.ReactNode} props.children - The child components.
@param {string[] | null} props.transactionInstructions - The transaction instructions in JSON format.
@param {function(string): void} [props.onTransactionSent] - Callback function when the transaction is sent.
@returns {JSX.Element} The rendered component.
Keyword arguments:
- `children` (a list of or a singular dash component, string or number; required): The child components to be rendered inside the wrapper.
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `transactionInstructions` (Array of Strings; required): The transaction instructions in JSON format, or an empty list if none.
"""
function dsc_transactionbuttonwrapper(; kwargs...)
        available_props = Symbol[:children, :id, :className, :transactionInstructions]
        wild_props = Symbol[]
        return Component("dsc_transactionbuttonwrapper", "TransactionButtonWrapper", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_transactionbuttonwrapper(children::Any; kwargs...) = dsc_transactionbuttonwrapper(;kwargs..., children = children)
dsc_transactionbuttonwrapper(children_maker::Function; kwargs...) = dsc_transactionbuttonwrapper(children_maker(); kwargs...)

