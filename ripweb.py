#!/usr/bin/env python
import os
from time import sleep
from flask import Flask, render_template
from ansi2html import Ansi2HTMLConverter
conv = Ansi2HTMLConverter()

#import ripweb
#PKGDIR=os.path.abspath(os.path.dirname(ripweb.__file__))
#print(PKGDIR)
#app = Flask(__name__, template_folder=os.path.join(PKGDIR, 'templates'))
app = Flask(__name__, template_folder='../../templates')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/stream')
def stream():
    def generate():
        with open('/var/log/cdrip.log') as f:
            while True:
                #yield f.read()
                logdata = "".join(f.readlines()[-50:])
                #logdata = f.read()
                if logdata:
                    html = conv.convert(logdata.decode('utf-8'))
                else:
                    html = ""
                #print(html)
                #yield logdata
                yield html
                sleep(5)

    return app.response_class(generate(), mimetype='text/html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
