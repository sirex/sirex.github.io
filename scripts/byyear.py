import argparse
import pathlib
import shutil


parser = argparse.ArgumentParser(description="""
    Organize all *.rst files in posts/ directory by year.
""")
args = parser.parse_args()

for path in pathlib.Path('posts').glob('*.rst'):
    print(path)
    with path.open() as f:
        for line in f:
            if line.startswith('.. date:'):
                date = line[len('.. date:'):].strip()
                year, _ = date.split('-', 1)
                (path.parent / year).mkdir(mode=0o755, exist_ok=True)
                shutil.move(path, path.parent / year / path.name)
                break
