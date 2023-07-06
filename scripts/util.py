from enum import Enum
from inspect import isfunction

def collect_names(variables):
    collected = {
        'function': [],
        'value': ['__bfg9000__'],
        'enum': [],
        'exception': [],
        'type': []
    }

    for name, value in sorted(variables.items()):
        if isfunction(value):
            collected['function'].append(name)
        elif not isinstance(value, type):
            collected['value'].append(name)
        elif issubclass(value, Enum):
            collected['enum'].append(name)
        elif issubclass(value, Exception):
            collected['exception'].append(name)
        else:
            collected['type'].append(name)

    return collected
