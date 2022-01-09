from flask import Flask, render_template
app = Flask (__name__)

@app.route("/")
def home():
    return render_template('index.html')

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/signin")
def signin():
    return render_template('signin.html')

@app.route("/search")
def search():
    return render_template('search.html')

@app.route("/admin")
def admin():
    return render_template('admin.html')

app.run()

