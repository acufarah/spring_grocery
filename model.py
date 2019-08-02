"""Model and database functions for Garden Trading App."""
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import UniqueConstraint
import json
from datetime import datetime
# from werkzeug.security import generate_password_hash, check_password_hash
from flask_migrate import Migrate


db = SQLAlchemy()

##############################################################################
# Model definitions

class Banana(db.Model):
    __tablename__= "bananas"

    banana_id = db.Column(db.Integer, primary_key = True)
    generation_number = db.Column(db.Integer, nullable = True)
    tree_id = db.Column(db.Integer, nullable = True)
    variety = db.Column(db.String(55), nullable = True)
    freeze_date = db.Column(db.DateTime, nullable = True)
    thaw_by_date = db.Column(db.DateTime, nullable = True)
    thawed_out_date = db.Column(db.DateTime, nullable = True)
    expiration_date = db.Column(db.DateTime, nullable = False)
    new_expiration_date = db.Column(db.DateTime, nullable = True)


def __repr__(self):
    return f"<Banana with id{self.banana_id} with expiration_date: {self.expiration_date} or new_expiration_date of {self.new_expiration_date}, has generation number: {self.generation_number}, tree_id: {self.tree_id}, and variety: {self.variety} >"

class Apple(db.Model):
    __tablename__= "apples"

    apple_id = db.Column(db.Integer, primary_key = True)
    pollination_group = db.Column(db.String, nullable = True)
    tree_id = db.Column(db.Integer, nullable = True)
    variety = db.Column(db.String, nullable = True)
    age_of_tree = db.Column(db.Integer, nullable = True)
    color = db.Column(db.String, nullable = True)
    freeze_date = db.Column(db.DateTime, nullable = True)
    thaw_by_date = db.Column(db.DateTime, nullable = True)
    thawed_out_date = db.Column(db.DateTime, nullable = True)
    expiration_date = db.Column(db.DateTime, nullable = False)
    new_expiration_date = db.Column(db.DateTime, nullable = True)

class Milk(db.Model):
    __tablename__ = "milk"

    cartons = db.Column(db.Integer, nullable = True)
    cow_id = db.Column(db.Integer, primary_key = True)
    cow_age = db.Column(db.Integer, nullable = True)
    cow_breed = db.Column(db.String, nullable = True)
    cow_length = db.Column(db.String, nullable = True)
    cow_weight = db.Column(db.String, nullable = True)
    expiration_date = db.Column(db.String, nullable = False)
    freeze_date = db.Column(db.String, nullable = True)
    thaw_by_date = db.Column(db.DateTime, nullable = True)
    thawed_out_date = db.Column(db.DateTime, nullable = True)
    new_expiration_date = db.Column(db.DateTime, nullable = True)
    vendor = db.Column(db.String, nullable = True)

class Butter(db.Model):
    __tablename__ = "butter"

    butter_id = db.Column(db.Integer, primary_key= True, autoincrement = True)
    cow_id = db.Column(db.Integer, nullable = False)
    carton = db.Column(db.String, nullable = True)
    churner = db.Column(db.String, nullable = False)
    number_sticks = db.Column(db.Integer, nullable = True)
    expiration_date = db.Column(db.DateTime, nullable = False)
    freeze_date = db.Column(db.String, nullable = True)
    thaw_by_date = db.Column(db.DateTime, nullable = True)
    thawed_out_date = db.Column(db.DateTime, nullable = True)
    new_expiration_date = db.Column(db.DateTime, nullable = True)

class Sales(db.Model):
    __tablename__ = "Sales"

    sale_id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    customer_name = db.Column(db.String, nullable = False)
    price_of_purchase = db.Column(db.Float, nullable = True)
    item_purchased = db.Column(db.Integer, nullable = False)







def connect_to_db(app, db_uri= 'postgres:///spring'):
    """Connect the database to our Flask app."""
    # Configure to use our database.
    
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLALCHEMY_ECHO'] = True
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)




if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.
    from flask import Flask

    app = Flask(__name__)
    connect_to_db(app)
    print("Connected to DB.")
