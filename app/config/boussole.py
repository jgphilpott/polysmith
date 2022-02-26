import os
import time

from sass import compile
from pathlib import Path

from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler

path = Path(os.path.dirname(os.path.realpath(__file__))).parent.absolute()

class Event(LoggingEventHandler):

    def dispatch(self, event):

        source = str(path) + "/sass"
        target = str(path) + "/css"

        try:

            compile(dirname=(source, target), output_style="compressed")
            print("\x1b[1;32mSuccess compiling Sass!\x1b[0m")

        except Exception as exception:

            print("\x1b[1;31mError compiling Sass!\x1b[0m")
            print(exception)

observer = Observer()

event_handler = Event()
event_dir = str(path) + "/sass"

observer.schedule(event_handler, event_dir, recursive=True)
observer.start()

try:

    while True:

        time.sleep(1)

except KeyboardInterrupt:

    observer.stop()

observer.join()