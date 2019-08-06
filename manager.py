import argparse
import ast
import os
import sys
import platform
import shutil
from distutils.dir_util import copy_tree

parser = argparse.ArgumentParser(description="This script copies files in and out of this folder so they can easily be treated as a repository for version control.")
parser.add_argument("mode", help='"deploy" with copy files from this folder to target folders across os. "gather" will copy files from across the os and copy them to this folder.',
                    choices=['deploy', 'gather'])

args = parser.parse_args()
mode = args.mode

# get value map of resources and their source/targ locations
platform_name = platform.system().lower()
with open(os.path.join(sys.path[0], "path_map_{}.py".format(platform_name)), "r") as file_:
    file_contents = file_.read()
value_map = ast.literal_eval(file_contents)


# varify value map values and populate full_path map
full_path_value_map = {}
for repo_path in value_map:
    os_path = value_map[repo_path]

    repo_path = os.path.join(sys.path[0], repo_path)
    os_path = os.path.join(os_path.replace('~', os.path.expanduser('~')))

    if mode == 'deploy':
        if not os.path.exists(repo_path):
            raise Exception("file does not exist: {}".format(repo_path))

    if mode == 'gather':
        if not os.path.exists(os_path):
            raise Exception("file does not exist: {}".format(os_path))

    full_path_value_map[repo_path] = os_path

def copy(src, dst, symlinks=False, ignore=None):
    """Actually copies files from src to dst
    """
    if os.path.isdir(src):
        if os.path.exists(dst):
            shutil.rmtree(dst)
        os.mkdir(dst)

        for item in os.listdir(src):
            s = os.path.abspath(os.path.join(src, item))
            d = os.path.abspath(os.path.join(dst, item))
            if os.path.isdir(s):
                print("{} >> {}".format(s, d))
                shutil.copytree(s, d, symlinks, ignore)
            else:
                print("{} >> {}".format(s, d))
                shutil.copy2(s, d)
    else:
        print("{} >> {}".format(src, dst))
        shutil.copy2(src, dst)


if mode == 'deploy':
    for repo_path in full_path_value_map:
        os_path = full_path_value_map[repo_path]

        copy(repo_path, os_path)

else:
    for repo_path in full_path_value_map:
        os_path = full_path_value_map[repo_path]

        copy(os_path, repo_path)

