# AUTO GENERATED FILE - DO NOT EDIT

from dash.development.base_component import Component, _explicitize_args


class WalletContextProvider(Component):
    """A WalletContextProvider component.


Keyword arguments:

- children (a list of or a singular dash component, string or number; required)

- id (string; optional):
    Unique ID to identify this component in Dash callbacks.

- className (string; optional):
    Adds CSS class name(s).

- network (a value equal to: 'mainnet-beta', 'testnet', 'devnet'; optional)

- rpcEndpoint (string; optional)"""
    _children_props = []
    _base_nodes = ['children']
    _namespace = 'dash_solana_components'
    _type = 'WalletContextProvider'
    @_explicitize_args
    def __init__(self, children=None, network=Component.UNDEFINED, rpcEndpoint=Component.UNDEFINED, id=Component.UNDEFINED, className=Component.UNDEFINED, **kwargs):
        self._prop_names = ['children', 'id', 'className', 'network', 'rpcEndpoint']
        self._valid_wildcard_attributes =            []
        self.available_properties = ['children', 'id', 'className', 'network', 'rpcEndpoint']
        self.available_wildcard_properties =            []
        _explicit_args = kwargs.pop('_explicit_args')
        _locals = locals()
        _locals.update(kwargs)  # For wildcard attrs and excess named props
        args = {k: _locals[k] for k in _explicit_args if k != 'children'}

        if 'children' not in _explicit_args:
            raise TypeError('Required argument children was not specified.')

        super(WalletContextProvider, self).__init__(children=children, **args)
