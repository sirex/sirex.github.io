.. title: Test one thing in one test function
.. slug: test-one-thing-in-one-test-function
.. date: 2020-01-02 13:53:26 UTC+02:00
.. tags: python, testing
.. category: 
.. link: 
.. description: 
.. type: text

.. default-role:: literal

When writing tests, we usually want to test multiple things in one test
function. We do that, because this way we need to write less. For example:

.. run: env/bin/py.test -vvx --color=yes %s
.. code-block:: python

    import pytest
    import sqlite3

    @pytest.fixture()
    def db():
        conn = sqlite3.connect(':memory:')
        conn.execute('CREATE TABLE t (key TEXT, val TEXT)')
        return conn

    def test_sqlite(db):
        # setup
        db.execute('INSERT INTO t (key, val) VALUES ("foo", "bar")')

        # test 1
        c = db.execute('SELECT * FROM t;')
        assert list(c) == [('foo', 'bar')]

        # test ...

        # test N
        c = db.execute('SELECT * FROM t WHERE key = "foo";')
        assert list(c) == [('foo', 'bar')]

Here we have a test, where two separate things are tested. It is convenient to
write tests way, because we only need to do setup once and then test multiple
things on the same setup.

Lets assume, that we wrote `sqlite3` module our tests fail at `test N` step. We
need to debug what is going one. Usually debuggin requires to hook into for
example `db.execute` and print some things or run a debugger like pdb_.

.. _pdb: https://docs.python.org/3/library/pdb.html

Since failure is only happens on last `test N` step, `db.execute` debugging
becomse quite complicated, because in this one test we run `db.execute`
multiple times. That means, we will see too much irrelevant output, which makes
it difficult to see only relevate output from our last `test N` step.

Usually I end up splitting such tests into many separate tests in order to make
debugging easier. For example, this test above could be split like this:

.. code-block:: python

    @pytest.fixture()
    def data(db):
        db.execute('INSERT INTO t (key, val) VALUES ("foo", "bar")')

    def test_sqlite_1(db, data):
        c = db.execute('SELECT * FROM t;')
        assert list(c) == [('foo', 'bar')]

    def test_sqlite_N(db, data):
        c = db.execute('SELECT * FROM t WHERE key = "foo";')
        assert list(c) == [('foo', 'bar')]

Now that is much better. I can run just `test_sqlite_N` and when debuggin, I
will see only relevant output.
