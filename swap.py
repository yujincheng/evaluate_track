import os
import sys
fr = open(sys.argv[1])
if not os.path.exists(sys.argv[2]):
  os.mkdir(sys.argv[2],0755)
fw = open(sys.argv[2]+'/second.txt',"a+")
line = fr.readline()
r = [0] * 8 
while line:
  line = line.split()
  if len(line)!=1:
    r[0] = line[0]
    r[1] = line[5]
    r[2] = line[6]
    r[3] = line[7]
    r[4] = line[1]
    r[5] = line[2]
    r[6] = line[3]
    r[7] = line[4]
    for i in r:
      fw.write("%s "%(i)),   
    fw.write('\n'),
  line = fr.readline()
