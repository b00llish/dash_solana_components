# AUTO GENERATED FILE - DO NOT EDIT

from dash.development.base_component import Component, _explicitize_args


class TransactionButtonWrapper(Component):
    """A TransactionButtonWrapper component.
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

- children (a list of or a singular dash component, string or number; required)

- id (string; optional):
    Unique ID to identify this component in Dash callbacks.

- className (string; optional):
    Adds CSS class name(s).

- transactionInstructions (list of strings; required)"""
    _children_props = []
    _base_nodes = ['children']
    _namespace = 'dash_solana_components'
    _type = 'TransactionButtonWrapper'
    @_explicitize_args
    def __init__(self, children=None, transactionInstructions=Component.REQUIRED, onTransactionSent=Component.UNDEFINED, id=Component.UNDEFINED, className=Component.UNDEFINED, **kwargs):
        self._prop_names = ['children', 'id', 'className', 'transactionInstructions']
        self._valid_wildcard_attributes =            []
        self.available_properties = ['children', 'id', 'className', 'transactionInstructions']
        self.available_wildcard_properties =            []
        _explicit_args = kwargs.pop('_explicit_args')
        _locals = locals()
        _locals.update(kwargs)  # For wildcard attrs and excess named props
        args = {k: _locals[k] for k in _explicit_args if k != 'children'}

        for k in ['transactionInstructions']:
            if k not in args:
                raise TypeError(
                    'Required argument `' + k + '` was not specified.')

        if 'children' not in _explicit_args:
            raise TypeError('Required argument children was not specified.')

        super(TransactionButtonWrapper, self).__init__(children=children, **args)
