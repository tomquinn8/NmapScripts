#!/usr/bin/env python

import datetime
import sys

# Take a number of seconds and output a human readable duration

input = int(float(sys.argv[1]))
print(str(datetime.timedelta(seconds=input)))
