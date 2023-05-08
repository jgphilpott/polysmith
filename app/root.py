from flask import Flask

from config.download import get_libs
from mongo.socket.plug import plugin

from config.compile import compile_files
from config.compress import compress_files

from routes.root import register_routes
from config.settings import configure_settings

src_dir = "app"
libs_dir = src_dir + "/libs"

app = Flask("Polymorph", template_folder=src_dir, static_folder=src_dir)

get_libs(libs_dir)

compile_files(src_dir)
compress_files(src_dir)

app = register_routes(app)
app = configure_settings(app)

plugin(app).run(app, host="0.0.0.0", port=4000)
