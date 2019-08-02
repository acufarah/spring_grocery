
from jinja2 import StrictUndefined
from flask import (Flask, render_template, redirect, request, json, jsonify, url_for, flash, session)
import os
from flask_debugtoolbar import DebugToolbarExtension
from model import Banana, Apple, Milk, Butter, Sales, connect_to_db, db
from flask_migrate import Migrate
from datetime import datetime, date




app = Flask(__name__)

migrate = Migrate(app, db)

app.secret_key = "ABC"


app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage."""

    apples = Apple.query.all()

    total_apples = Apple.query.count()

    bananas = Banana.query.all()

    total_bananas = Banana.query.count()

    milk = Milk.query.all()

    def sum_cartons(milk):
    	sum_cartons = 0
    	for m in milk:
    		if m.cartons is not None:
    			sum_cartons += m.cartons
    	return sum_cartons

    total_milk = sum_cartons(milk)

    butter = Butter.query.all()

    def total_number_sticks(butter):
    	sum_butter = 0

    	for b in butter:
    		if b.number_sticks is not None:
    			sum_butter+= b.number_sticks
    	return sum_butter

    total_sticks = total_number_sticks(butter)

    total_items = total_apples + total_bananas + total_milk + total_sticks

    return render_template("home.html", total_items = total_items, total_apples = total_apples,
    						total_bananas = total_bananas, total_milk = total_milk,
    						total_sticks = total_sticks)


@app.route('/bananas')
def get_all_bananas():
	"""Shows all bananas and total number of bananas"""
	bananas = Banana.query.all()

	total_bananas = Banana.query.count()

	return render_template('/bananas.html', bananas = bananas, total = total_bananas)

@app.route('/apples')
def get_all_apples():
	"""Shows all apples and total number of apples"""
	apples = Apple.query.all()

	total_apples = Apple.query.count()

	return render_template('/apples.html', apples = apples, total = total_apples)

@app.route('/milk')
def get_milk_info():

	milk = Milk.query.all()

	def sum_cartons(milk):
		sum_cartons = 0

		for m in milk:
			if m.cartons is not None:
				sum_cartons+= m.cartons
		return sum_cartons

	total_milk = sum_cartons(milk)

	return render_template('/milk.html', milk = milk, total_milk = total_milk)

@app.route('/butter')
def get_butter_info():
	butter = Butter.query.all()

	def total_number_sticks(butter):
		sum_butter = 0

		for b in butter:
			if b.number_sticks is not None:
				sum_butter+= b.number_sticks
		return sum_butter

	total_sticks = total_number_sticks(butter)

	return render_template('/butter.html', butter = butter, total_sticks = total_sticks)

@app.route('/sales')
def get_sales_info():

	sales = Sales.query.all()

	def total_sales(sales):
		sum_sales = 0
		for s in sales:
			if s.price_of_purchase is not None:
				sum_sales+= s.price_of_purchase
		return sum_sales

	sales_total = total_sales(sales)

	return render_template('/sales.html', sales = sales, sales_total= sales_total)

@app.route('/delete_sold_fruit', methods =["POST"])
def delete_sold_fruit():
	"""Delete sold fruit inventory"""
	item_id = request.form.get("item_id")

	banana = Banana.query.filter(Banana.banana_id == item_id).first()

	apple = Apple.query.filter(Apple.apple_id == item_id).first()

	if banana is not None:
		db.session.delete(banana)
	elif apple is not None:
		db.session.delete(apple)
	else:
		flash('There is no item with that id in the fruit inventory to delete')
	db.session.commit()
	flash('Item with that id was successfully deleted.')
	return redirect('/')

@app.route('/update_milk', methods=["POST"])
def update_milk_for_butter():
	"""Change number of cartons of milk when used for butter."""
	cow_id = request.form.get("cow_id")
	number_cartons_used = request.form.get("number_cartons")

	Milk.query.filter(Milk.cow_id == cow_id).update({"cartons": Milk.cartons - number_cartons_used}, synchronize_session='evaluate')

	db.session.commit()
	flash('Number of cartons for cow with that id successfully updated')

	return redirect('/')

@app.route('/delete_expired_items', methods=["POST"])
def delete_expired_items():
	"""Delete expired items based on the present date"""

	today1 = date.today()
	today = today1.strftime("%Y-%m-%d")

	expired_bananas = Banana.query.filter(Banana.expiration_date <= today).all()

	expired_apples = Apple.query.filter(Apple.expiration_date <= today).all()

	expired_milk = Milk.query.filter(Milk.expiration_date <= today).all()

	expired_butter = Butter.query.filter(Butter.expiration_date <= today).all()

	if expired_bananas is not None:
		for e in expired_bananas:
			db.session.delete(e)
	elif expired_apples is not None:
		for e in expired_apples:
			db.session.delete(e)
	elif expired_milk is not None:
		for e in expired_milk:
			db.session.delete(e)
	elif expired_butter is not None:
		for e in expired_butter:
			db.session.delete(e)

	db.session.commit()
	flash('Expired items have been deleted')

	return redirect('/')













if __name__ == "__main__":
    
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(host="0.0.0.0")
