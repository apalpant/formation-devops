import logging

from flask import Flask
app = Flask(__name__)


from logstash_async.handler import AsynchronousLogstashHandler
from logstash_async.formatter import LogstashFormatter

test_logger = logging.getLogger('python-logstash-logger')
test_logger.setLevel(logging.INFO)


LOGSTASH_HOST = "172.18.0.3"
LOGSTASH_DB_PATH = "python-elk-logstash.db"
LOGSTASH_TRANSPORT = "logstash_async.transport.BeatsTransport"
LOGSTASH_PORT = 5044

logstash_handler = AsynchronousLogstashHandler(
    LOGSTASH_HOST,
    LOGSTASH_PORT,
    transport=LOGSTASH_TRANSPORT,
    database_path=LOGSTASH_DB_PATH
)

logstash_formatter = LogstashFormatter(
    message_type='python-logstash',
    extra_prefix='dev',
    extra=dict(application='example-app', environment='production'))
logstash_handler.setFormatter(logstash_formatter)
test_logger.addHandler(logstash_handler)

# logstash_handler.formatter = FlaskLogstashFormatter(metadata={"beat": "myapp"})
# app.logger.addHandler(logstash_handler)

@app.route('/')
def hello_world():  
    # app.logger.info("Hello there")
    test_logger.info("Hello there")
    return 'Hello, World!'