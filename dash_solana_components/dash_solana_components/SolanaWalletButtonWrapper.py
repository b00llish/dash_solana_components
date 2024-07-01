# AUTO GENERATED FILE - DO NOT EDIT

from dash.development.base_component import Component, _explicitize_args


class SolanaWalletButtonWrapper(Component):
    """A SolanaWalletButtonWrapper component.


Keyword arguments:

- children (a list of or a singular dash component, string or number; optional):
    The child components to be rendered inside the wrapper.

- id (string; optional):
    Unique ID to identify this component in Dash callbacks.

- className (string; optional):
    Adds CSS class name(s).

- rpcEndpoint (string; optional):
    The custom RPC endpoint for the wallet. If it's not provided, the
    default endpoint for the specified network will be used."""
    _children_props = []
    _base_nodes = ['children']
    _namespace = 'dash_solana_components'
    _type = 'SolanaWalletButtonWrapper'
    @_explicitize_args
    def __init__(self, children=None, rpcEndpoint=Component.UNDEFINED, id=Component.UNDEFINED, className=Component.UNDEFINED, **kwargs):
        self._prop_names = ['children', 'id', 'className', 'rpcEndpoint']
        self._valid_wildcard_attributes =            []
        self.available_properties = ['children', 'id', 'className', 'rpcEndpoint']
        self.available_wildcard_properties =            []
        _explicit_args = kwargs.pop('_explicit_args')
        _locals = locals()
        _locals.update(kwargs)  # For wildcard attrs and excess named props
        args = {k: _locals[k] for k in _explicit_args if k != 'children'}

        super(SolanaWalletButtonWrapper, self).__init__(children=children, **args)
