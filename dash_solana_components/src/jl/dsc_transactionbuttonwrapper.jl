# AUTO GENERATED FILE - DO NOT EDIT

export dsc_transactionbuttonwrapper

"""
    dsc_transactionbuttonwrapper(;kwargs...)
    dsc_transactionbuttonwrapper(children::Any;kwargs...)
    dsc_transactionbuttonwrapper(children_maker::Function;kwargs...)


A TransactionButtonWrapper component.
A wrapper component for transaction buttons that handles Solana transaction instructions.
A button can be clicked to send a transaction to the Solana network, using the instructions
passed to the transactionInstructions prop.
@param {Object} props - The properties for the component.
@param {string} props.id - The ID of the component.
@param {string} props.className - The CSS class of the component.
@param {function} props.setProps - Function to set properties.
@param {React.ReactNode} props.children - The child components. This should be a single button or any component that has an "onClick" event.
@param {string[] | null} props.transactionInstructions - The transaction instructions in JSON format.
@returns {JSX.Element} The rendered component.
Keyword arguments:
- `children` (a list of or a singular dash component, string or number; optional): Content
- `id` (String; optional): Unique ID to identify this component in Dash callbacks.
- `className` (String; optional): Adds CSS class name(s).
- `transactionInstructions` (Array of Strings; optional): The transaction instructions in JSON format, or an empty list if none.
"""
function dsc_transactionbuttonwrapper(; kwargs...)
        available_props = Symbol[:children, :id, :className, :transactionInstructions]
        wild_props = Symbol[]
        return Component("dsc_transactionbuttonwrapper", "TransactionButtonWrapper", "dash_solana_components", available_props, wild_props; kwargs...)
end

dsc_transactionbuttonwrapper(children::Any; kwargs...) = dsc_transactionbuttonwrapper(;kwargs..., children = children)
dsc_transactionbuttonwrapper(children_maker::Function; kwargs...) = dsc_transactionbuttonwrapper(children_maker(); kwargs...)

