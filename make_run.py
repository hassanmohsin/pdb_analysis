import os
from glob import glob

commands = []

ent_files = glob('../pdb/*/*.ent')

for _file in ent_files:
    output_dir = os.path.splitext(_file)[0]
    output_dir = os.path.split(output_dir)[1]
    output_file = os.path.join(output_dir, 'report.xml')
    if os.path.isfile(output_file):continue
    commands.append("python ../plip-stable/plip/plipcmd.py -f {0} -o {1} -x".format(_file, output_dir))


with open('run.sh', 'w') as f:
    for line in commands:
        f.write(line + '\n')

