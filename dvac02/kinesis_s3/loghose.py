import logging
import time

from logging.handlers import TimedRotatingFileHandler


def create_timed_rotating_log(path):
    logger = logging.getLogger("Rotating Log")
    logger.setLevel(logging.INFO)

    handler = TimedRotatingFileHandler(path,
                                       when="s",
                                       interval=10,
                                       backupCount=5)
    logger.addHandler(handler)

    for i in range(6):
        logger.info({"message": "This is a test message", "count": i})
        time.sleep(15)


if __name__ == "__main__":
    log_file = "/var/log/loghose.log"
    create_timed_rotating_log(log_file)


# SOURCE: https://docs.python.org/2/howto/logging-cookbook.html#using-file-rotation
