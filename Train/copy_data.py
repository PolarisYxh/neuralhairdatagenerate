import os 
import shutil
names = os.listdir("/data/HairStrand/convdata")

for n in names:
    shutil.copyfile(os.path.join("/data/HairStrand/blend_hairs",n),os.path.join("/data/HairStrand/blend_hairfortrain"),n)
    