"""
Execute all code in an .rst file.

This script will create copy of .rst file, converts it into a python file,
executes that python file and filanlly replaces paths in output to original
.rst.file.
"""

import argparse
import pathlib
import subprocess
import sys
import tempfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('path', metavar='FILE', type=pathlib.Path)
    args = parser.parse_args()

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = pathlib.Path(tmpdir)
        runfile = tmpdir / 'run.py'

        metadata = {}
        with runfile.open('w') as f:
            for line in resttopy(args.path, metadata):
                f.write(line)

        if 'run' in metadata:
            runcmd = metadata['run'] % runfile
        else:
            runcmd = 'env/bin/python %s'

        if '%s' in runcmd:
            runcmd = runcmd % runfile

        if runcmd.startswith('env/bin/'):
            here = pathlib.Path().resolve()
            runcmd = f'{here}/{runcmd}'

        p = subprocess.run(
            runcmd,
            shell=True,
            cwd=tmpdir,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        )
        stdout = p.stdout
        stdout = stdout.replace('run.py', str(args.path))
        print(stdout)


def resttopy(path: pathlib.Path, metadata: dict):
    code = False

    with path.open() as f:
        for i, line in enumerate(f):

            # Collect metadata
            if line.startswith('.. ') and ':' in line:
                name, value = line[len('..'):].split(':', 1)
                metadata[name.strip()] = value.strip()

            # Detect end of code block
            if code and line.strip() and line[:4] != '    ':
                code = False

            # Comment out everything except code
            if code:
                assert line.strip() == '' or line[:4] == '    ', (
                    f"Can't parse code line at {path}:{i}:\n\n    {line!r}"
                )
                if line.startswith('   '):
                    yield line[4:]
                else:
                    yield line
            else:
                yield '# ' + line

            # Detect start of code block
            if line.startswith(('.. code-block:: python', '.. code-block: python')):
                code = True


if __name__ == "__main__":
    main()
