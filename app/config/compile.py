import subprocess
from sass import compile

def compile_files(src_dir):

    libs_dir = src_dir + "/libs"

    js_libs_dir = libs_dir + "/js"
    css_libs_dir = libs_dir + "/css"

    styles_dir = src_dir + "/styles"
    scripts_dir = src_dir + "/scripts"

    subprocess.Popen(["tsc", "-w", scripts_dir + "/root.ts"])
    subprocess.Popen(["coffee", "-cbw", "--no-header", scripts_dir])
    compile(dirname=(styles_dir, css_libs_dir), output_style="compressed")
    subprocess.Popen(["node-sass", "-w", styles_dir, "-o", css_libs_dir, "--output-style", "compressed"])
