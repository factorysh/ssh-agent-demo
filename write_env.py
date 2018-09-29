#!/usr/bin/env python

with open('.env', 'w') as f:
    f.write('PRIVATE=')
    for line in open('demo', 'r'):
        f.write(line[:-1])
        f.write('\\n')