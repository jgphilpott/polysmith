import os
import subprocess
from threading import Thread

def compress(src_dir):

    for dirs, subdirs, files in os.walk("./" + src_dir):

        for file in files:

            path = os.path.join(dirs, file)
            name, extension = os.path.splitext(path)

            if extension == ".js":

                subprocess.run(["uglifyjs", path, "-co", path])

def compress_files(src_dir):

    Thread(target=compress, args=(src_dir,)).start()
