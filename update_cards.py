#!/usr/bin/env python3

import os
import sys
import re

print("Current directory: "+os.getcwd())
if not re.match(r'.*\/holotable/cards/starwars$', os.getcwd()):
  print("Changing directory from: "+os.getcwd()+" to: holotable/cards/starwars")
  os.chdir("holotable/cards/starwars")
  print("Current directory: "+os.getcwd())

releases = os.popen("cd ../../../../holotable/Images-HT/starwars && find . -maxdepth 1 -mindepth 1 -type d | sort").read()
for release in releases.split("\n"):
  if (release != ""):
    if (os.path.isdir(release)):
      print("  * "+release+" exists")
    else:
      print("  ! "+release+" MISSING")
      os.mkdir(release)
      os.mkdir(release+"/large")
    print("  * updating images")
    print("    - copying t_ images")
    os.popen("rsync -av --include='t_*' --exclude='*' ../../../../holotable/Images-HT/starwars/"+release+"/ "+release+"/").read()
    print("    - copying large gif images")
    os.popen("rsync -av --include='*.gif' --exclude='*' ../../../../holotable/Images-HT/starwars/"+release+"/large/ "+release+"/large/").read()



