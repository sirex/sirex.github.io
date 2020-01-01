import pathlib
import argparse


parser = argparse.ArgumentParser()
parser.add_argument('paths', metavar='FILE', nargs='+', type=pathlib.Path)
args = parser.parse_args()

for path in args.paths:
    print(path)
    repl = {
        'created': 'date',
    }
    meta = {
        'title': '',
        'slug': '',
        'date': '',
        'tags': '',
        'category': '',
        'link': '',
        'description': '',
        'type': 'text',
        'status': '',
    }
    with path.open() as f:
        line = next(f)

        # Skip Nikola files
        if line.startswith('.. title:'):
            continue

        # Read title
        meta['title'] = line.strip()
        line = next(f).strip()
        assert line == ('#' * len(line)), line

        # Read metadata
        line = next(f)
        assert line.strip() == '', line
        while line := next(f).strip():  # noqa
            assert line.startswith(':'), line
            name, value = line.split(None, 1)
            name = name.strip(':')
            name = repl.get(name, name)
            if name in meta:
                meta[name] = value.strip()

        # Read everything else
        tail = f.read()

    # If not given, take slug from file name
    if meta['slug'] == '':
        meta['slug'] = path.stem

    # Add time zone to dates, but it also would be nice to take into account
    # day light saving time
    if len(meta['date']) == 16:
        meta['date'] = meta['date'] + ':00 UTC+02:00'

    # Rename tags
    meta['tags'] = meta['tags'].replace('command-line', 'shell')

    # Check if all tags are comma separated
    assert (
        ' ' not in meta['tags'] or (
            ' ' in meta['tags'] and
            ',' in meta['tags']
        )
    ), meta['tags']

    with path.with_suffix('.lt.rst').open('w') as f:
        # Write converted meta data
        for k, v in meta.items():
            if v:
                print(f'.. {k}: {v}', file=f)

        # And rest of the file
        print(file=f)
        print(tail, file=f)

    # Delete original file
    path.unlink()
