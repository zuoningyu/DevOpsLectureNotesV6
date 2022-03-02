from flask import Flask

from app_helper import setup_metrics

app = Flask(__name__)
setup_metrics(app)


@app.route('/test/')
def test():
    return 'rest'


@app.route('/test1/')
def test1():
    1/0
    send_mq(save_to_db)
    return 'rest'


@app.errorhandler(500)
def handle_500(error):
    return str(error), 500


if __name__ == '__main__':
    app.run()
