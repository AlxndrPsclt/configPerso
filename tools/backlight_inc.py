#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import argparse
from sys import exit

parser = argparse.ArgumentParser(description='Simple tool to adjust screen bightness, using linux light tool.')

parser.add_argument('-i', '--increase', 
                    action='store_true',
                    help="Increase brghtness",
                    default= False)
parser.add_argument('-d', '--decrease', 
                    action='store_true',
                    help="Decrease brightness",
                    default= False)

args = parser.parse_args()

increase=args.increase
decrease=args.decrease

if ( increase==decrease ):
    print("Can't increase and decrease brightness at the same time")
    exit()


import subprocess

res=subprocess.run(["sudo", "light"], stdout=subprocess.PIPE)
light_level=float(res.stdout)

if increase:
    if light_level>=5:
        increment=5
    else:
        increment=1
else:
    if light_level>5:
        increment=5
    else:

res=subprocess.run(["sudo", "light", "-A", str(inc)])

print(inc)
