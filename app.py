from flask import Flask,render_template,request,redirect,url_for,session
from flask_sqlalchemy import SQLAlchemy
import json
from datetime import datetime

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super_secret_key'

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

# Classes of enotes database

class Admin(db.Model):
    sl_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    passwd = db.Column(db.String(20), nullable=False)

class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    phone_num = db.Column(db.String(13), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Document(db.Model):

    doc_no = db.Column(db.Integer, primary_key=True)
    doc_name = db.Column(db.String(80), nullable=False)
    sub_no = db.Column(db.String(15), nullable=False)
    sem_no = db.Column(db.Integer, nullable=False)
    mod_no = db.Column(db.Integer, nullable=False)
    link = db.Column(db.String(200), nullable=False)
    date_time = db.Column(db.String(12), nullable=True)

class Subject(db.Model):
    sub_code = db.Column(db.String(15), primary_key=True)
    sub_name =  db.Column(db.String(80), nullable=False)
    sem_no = db.Column(db.Integer, nullable=False)

class User(db.Model):
    usn = db.Column(db.String(20),primary_key=True, nullable=False)
    user_name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    passwd = db.Column(db.String(20), nullable=False)


# Home Page

@app.route("/")
def home():
    return render_template('index.html', params=params)

# Login and Signin page

@app.route("/login", methods=['GET','POST'])
def login():
    if request.method == "POST":
        usn = request.form["usn"]
        passwod = request.form["password"]

        login = User.query.filter_by(usn=usn, passwd=passwod).first()
        if login is not None:
            return redirect(url_for("contact"))
    return render_template('login.html')

@app.route("/signin", methods= ['GET', 'POST'])
def signin():
    if request.method == "POST":
        usn = request.form['usn']
        username = request.form['name']
        email = request.form['email']
        passw = request.form['password']

        login = User.query.filter_by(usn=usn).first()
        if login is not None:
            return redirect(url_for("signin"))
        else:
            register = User(usn=usn, user_name=username, email=email, passwd=passw)
            db.session.add(register)
            db.session.commit()
            return redirect(url_for("login"))

    return render_template('signin.html')

# Search Page

@app.route("/search", methods = ['GET'])
def search():
    document = Document.query.filter_by().all()
    return render_template('search.html', params=params, document=document )


# Contacts page

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''add entry to database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name = name, email = email, phone_num = phone, msg = message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html', params=params)

# Subjects page

@app.route("/subject/<string:sem_slug>")
def sem(sem_slug):
    sub = Subject.query.filter_by(sem_no= sem_slug).all()
    return render_template('subject.html', params=params, sub = sub)

# Documents page

@app.route("/document/<string:sub_slug>", methods = ['GET'])
def doc(sub_slug):
    document = Document.query.filter_by(sub_no = sub_slug ).all()
    return render_template('document.html', params=params, document=document )

# About page

@app.route("/about")
def about():
    return render_template('about.html', params=params)


#  Admin pages


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():

    if ('admin' in session and session['admin'] == params['admin_user'] ):
        return render_template('dashboard.html')

    if request.method == 'POST' :
        username = request.form.get('uname')
        userpass = request.form.get('password')
        if(username == params['admin_user'] and userpass == params['admin_pass']):
            session['admin'] = username
            return render_template('dashboard.html')

    return render_template('adminlogin.html')

@app.route("/admindocument" , methods=['GET', 'POST'])
def admindocument():
    if ('admin' in session and session['admin'] == params['admin_user']):
        document= Document.query.filter_by().all()
        return render_template('admindocument.html', document=document)

@app.route("/edit/<string:doc_slug>",methods = ['GET' ,'POST'])
def editdoc(doc_slug):
    if ('admin' in session and session['admin'] == params['admin_user']):
        document = Document.query.filter_by(doc_no = doc_slug).first()
        if request.method == 'POST':
            doc_name = request.form.get('docname')
            sub_no = request.form.get('subcode')
            sem_no = request.form.get('semnum')
            mod_no = request.form.get('modnum')
            link = request.form.get('doclink')

            document.doc_name = doc_name
            document.sub_no = sub_no
            document.sem_no = sem_no
            document.mod_no = mod_no
            document.link = link
            document.date_time = datetime.now()
            db.session.commit()
            return redirect(url_for("admindocument"))
        return render_template("edit.html", document = document)

@app.route("/deletedoc/<string:docno_slug>", methods = ['GET' ,'POST'])
def deledoc(docno_slug):
    if ('admin' in session and session['admin'] == params['admin_user']):
        Document.query.filter_by(doc_no = docno_slug).delete()
        db.session.commit()
        return redirect(url_for("admindocument"))

@app.route("/upload", methods = ['GET', 'POST'])
def upload():
    if ('admin' in session and session['admin'] == params['admin_user']):
        if (request.method == 'POST'):
            '''add entry to database'''
            doc_name = request.form.get('docname')
            sub_no = request.form.get('subcode')
            sem_no = request.form.get('semnum')
            mod_no = request.form.get('modnum')
            link = request.form.get('doclink')
            upload = Document(doc_name = doc_name, sub_no = sub_no, sem_no = sem_no, mod_no = mod_no, link = link, date_time = datetime.now())
            db.session.add(upload)
            db.session.commit()
        return render_template('upload.html', params=params)

@app.route("/users", methods=['GET', 'POST'])
def user():
    if ('admin' in session and session['admin'] == params['admin_user']):
        user = User.query.filter_by().all()
        return render_template('users.html', user=user)

@app.route("/deleteuser/<string:usn_slug>", methods = ['GET' ,'POST'])
def deleuser(usn_slug):
    if ('admin' in session and session['admin'] == params['admin_user']):
        User.query.filter_by(usn = usn_slug).delete()
        db.session.commit()
        return redirect(url_for("user"))

@app.route("/conadmin", methods=['GET', 'POST'])
def conadmin():
    if ('admin' in session and session['admin'] == params['admin_user']):
        contact = Contact.query.filter_by().all()
        return render_template('conadmin.html', contact=contact)

@app.route("/logout")
def logout():
    session.pop('admin')
    return redirect("/dashboard")





app.run(debug=True)

