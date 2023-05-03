#!/usr/bin/env python3

import os
import sys
import yaml
from qutebrowser.api import cmdutils
from qutebrowser.api import message
from qutebrowser.misc import objects

@cmdutils.register()
def save_tabs():
    tabs = []
    for win_id, window in objects.backend.get_windows().items():
        for tab in window:
            tabs.append({'title': tab.title(), 'url': tab.url().toString()})

    yaml_data = yaml.dump(tabs, default_flow_style=False, allow_unicode=True)
    output_path = os.path.expanduser('~/atelier/data/qutebrowser/saved_tabs.yml')

    with open(output_path, 'w') as f:
        f.write(yaml_data)

    message.info("Saved tabs to: {}".format(output_path))

if __name__ == '__main__':
    save_tabs()
