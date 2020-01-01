.. title: Hello ASGI
.. slug: hello-asgi
.. date: 2018-03-30
.. tags: python, web, asgi
.. type: text

Python programming language has WSGI_ (Web Server Gateway Interface) standard,
where web servers can talk to apps using same standartized protocol. Simplest
WSGI application looks like this:

.. _WSGI: https://www.python.org/dev/peps/pep-0333/

.. code-block:: python

    import json

    def wsgi(environ, start_response):
        start_response('200 OK', [
            ('Content-Type', 'application/json'),
        ])
        yield json.dumps(environ, default=repr).encode()

Response:

.. code-block:: json

    {
      "wsgi.errors": "<gunicorn.http.wsgi.WSGIErrorsWrapper object at 0x7fe381c1aef0>",
      "wsgi.version": [1, 0],
      "wsgi.multithread": false,
      "wsgi.multiprocess": false,
      "wsgi.run_once": false,
      "wsgi.file_wrapper": "<class 'gunicorn.http.wsgi.FileWrapper'>",
      "SERVER_SOFTWARE": "gunicorn/19.7.1",
      "wsgi.input": "<gunicorn.http.body.Body object at 0x7fe381c1af60>",
      "gunicorn.socket": "<socket.socket fd=9, family=AddressFamily.AF_INET, type=SocketKind.SOCK_STREAM, proto=0, laddr=('127.0.0.1', 8000), raddr=('127.0.0.1', 59066)>",
      "REQUEST_METHOD": "GET",
      "QUERY_STRING": "",
      "RAW_URI": "/",
      "SERVER_PROTOCOL": "HTTP/1.1",
      "HTTP_HOST": "localhost:8000",
      "HTTP_USER_AGENT": "curl/7.59.0",
      "HTTP_ACCEPT": "*/*",
      "HTTP_CONNECTION": "Upgrade, HTTP2-Settings",
      "HTTP_UPGRADE": "h2c",
      "HTTP_HTTP2_SETTINGS": "AAMAAABkAARAAAAAAAIAAAAA",
      "wsgi.url_scheme": "http",
      "REMOTE_ADDR": "127.0.0.1",
      "REMOTE_PORT": "59066",
      "SERVER_NAME": "127.0.0.1",
      "SERVER_PORT": "8000",
      "PATH_INFO": "/",
      "SCRIPT_NAME": ""
    }

Now there is a new standard emerging, called ASGI_ (Asynchronous Server Gateway
Interface). This new standard tries to fix WSGI limitations and provides more
flexible interface, that can support multiple protocols like HTTP, HTTP/2,
WebSockets and others. In addition ASGI provides possibility to use asyncio in
web apps. Simples ASGI application looks like this:

.. _ASGI: https://github.com/django/asgiref/blob/master/specs/asgi.rst

.. code-block:: python

    import json


    def asgi(scope):
        async def chat(receive, send):
            await receive()
            await send({
                'type': 'http.response.start',
                'status': 200,
                'headers': [
                    [b'Content-Type', b'application/json'],
                ],
            })
            await send({
                'type': 'http.response.body',
                'body': json.dumps(scope, default=bytes.decode).encode(),
            })
            await send({
                'type': 'http.disconnect',
            })
        return chat

Response:

.. code-block:: json

    {
      "type": "http",
      "http_version": "2",
      "method": "GET",
      "path": "/",
      "root_path": "",
      "scheme": "https",
      "query_string": "",
      "headers": [
        ["host", "localhost:8000"],
        ["user-agent", "curl/7.59.0"],
        ["accept", "*/*"]
      ],
      "client": ["127.0.0.1", 59012],
      "server": ["127.0.0.1", 8000]
    }

ASGI is a bit more complicated, but gives support for modern web protocols and
*asyncio*.
