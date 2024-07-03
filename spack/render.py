# -*- coding: utf-8 -*-
from jinja2 import Environment, FileSystemLoader
import os


DATA = {
    "apple_clang_version": "15.0.0",
    "cmake_version": "3.29.6",
    "gcc_major_version": "14",
    "gcc_version": "14.1.0",
}


def main():
    this_dir = os.path.abspath(os.path.dirname(__file__))
    template_file = os.path.join(this_dir, "spack.yaml.in")
    search_path, template_name = template_file.rsplit("/", maxsplit=1)
    loader = FileSystemLoader(search_path)
    env = Environment(loader=loader)
    template = env.get_template(template_name)
    src = template.render(**DATA)
    target_file = os.path.join(this_dir, "spack.yaml")
    with open(target_file, "w") as f:
        f.write(src)


if __name__ == "__main__":
    main()
