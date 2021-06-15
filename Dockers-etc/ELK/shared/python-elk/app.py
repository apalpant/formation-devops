import logging

from flask import Flask
app = Flask(__name__)


from logstash_async.handler import AsynchronousLogstashHandler
from logstash_async.formatter import LogstashFormatter

# Create the logger and set it's logging level
logger = logging.getLogger("logstash")
logger.setLevel(logging.ERROR)        

# Create the handler
handler = AsynchronousLogstashHandler(
    host='172.18.0.3', 
    port=5042, 
    ssl_enable=True, 
    ssl_verify=False,
    database_path='python-elk-logstash.db')
# Here you can specify additional formatting on your log record/message
formatter = LogstashFormatter()
handler.setFormatter(formatter)

# Assign handler to the logger
logger.addHandler(handler)

@app.route('/')
def hello_world():  
    logger.info("Hello there")
    return 'Hello, World!'