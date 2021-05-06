import os
from datetime import datetime


def myScan():
    scan = os.scandir()
    nb = 0
    for entry in scan:
        nb += 1
        stat = entry.stat()
        size = stat.st_size
        nom = entry.name
        time = stat.st_mtime
        mode = stat.st_mode
        prefix = ""
        if(mode == 33279 or mode == 16895):
            mode = "rwxrwxrwx"
        else:
            mode = "--------"
        if(entry.is_dir()):
            prefix = "d"
        else:
            prefix = "-"

        print("{}{} ({}) {} {} {}".format(prefix, mode, stat.st_mode,
                                          size, datetime.fromtimestamp(int(time)), nom))

    print(nb)
    scan.close()
