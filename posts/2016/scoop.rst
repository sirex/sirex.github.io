.. title: SCOOP
.. slug: scoop
.. date: 2016-05-29
.. tags: python, streams, data
.. type: text

I found an `article`__ about processing `Common Crawl`_ data in parallel.

.. __: https://medium.com/@paulrim/mining-common-crawl-with-php-39e14082c55c?source=post_page-----6cc4108e97eb----------------------
.. _Common Crawl: http://commoncrawl.org/

Decided to try same thing using SCOOP_.

.. _SCOOP: https://github.com/soravux/scoop

.. code-block:: python

    import io
    import csv
    import gzip
    import urllib.parse
    import urllib.request

    import scoop
    import scoop.futures


    def read_gzip(url):
        with urllib.request.urlopen(url) as response:
            yield from gzip.open(io.BufferedReader(response))


    def get_themes(url):
        themes = []
        domain = None
        theme_path = b'wp-content/themes/'
        scoop.logger.info('parsing: %s' % url)
        for line in read_gzip(url):
            if line.startswith(b'WARC-Target-URI:'):
                domain = line[17:].decode('utf-8').strip()
                domain = urllib.parse.urlparse(domain).netloc
            elif theme_path in line:
                start = line.index(theme_path) + len(theme_path)
                end = line.find(b'/', start)
                if end >= 0:
                    themes.append((domain, line[start:end].decode('utf-8')))
        return themes


    def main():
        lines = read_gzip('https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-2016-07/warc.paths.gz')
        paths = ['https://commoncrawl.s3.amazonaws.com/' + x.decode('utf-8').strip() for x in lines]
        with open('results.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['domain', 'theme'])
            for result in scoop.futures.map(get_themes, paths):
                for domain, theme in result:
                    writer.writerow([domain, theme])


    if __name__ == "__main__":
        main()

SCOOP_ allows to run scripts on multiple cores locally or on multiple remote
machines via ssh. In order to do that, you need to install SCOOP and this
script on each machine and list those machines in a hosts file, that will be
read by SCOOP. Server setup part probably can be done with Ansible.

I tried to run this scripts on two servers, each server takes about 15 minutes
to download one ~800 Mb warc file and 2.5 minutes to process it.

All processing is done by reading streams, so there is no need for extra
storage on server nodes.

Here is how I run it:

.. code-block:: sh

    python -m scoop --hostfile hosts --tunnel --python-interpreter /tmp/scoops/bin/python -p /tmp/scoops run.py
