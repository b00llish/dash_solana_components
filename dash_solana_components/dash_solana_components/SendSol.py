# AUTO GENERATED FILE - DO NOT EDIT

from dash.development.base_component import Component, _explicitize_args


class SendSol(Component):
    """A SendSol component.


Keyword arguments:

- id (string; optional):
    Unique ID to identify this component in Dash callbacks.

- className (string; optional):
    Adds CSS class name(s)."""
    _children_props = []
    _base_nodes = ['children']
    _namespace = 'dash_solana_components'
    _type = 'SendSol'
    @_explicitize_args
    def __init__(self, id=Component.UNDEFINED, className=Component.UNDEFINED, **kwargs):
        self._prop_names = ['id', 'className']
        self._valid_wildcard_attributes =            []
        self.available_properties = ['id', 'className']
        self.available_wildcard_properties =            []
        _explicit_args = kwargs.pop('_explicit_args')
        _locals = locals()
        _locals.update(kwargs)  # For wildcard attrs and excess named props
        args = {k: _locals[k] for k in _explicit_args}

        super(SendSol, self).__init__(**args)
