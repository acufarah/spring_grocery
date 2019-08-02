import datetime
from sqlalchemy import func
from sqlalchemy.orm import exc
import glob
import csv

from model import Banana, Apple, Milk, Butter, Sales, connect_to_db, db
from app import app

def load_apple_fruits():

	heritage_farms_list = glob.glob("heritage_farms/*.csv")
	print("Got this far")
	for filename in heritage_farms_list:
		with open(filename) as csv_file:
			csv_reader = csv.reader(csv_file, delimiter=',')
			next(csv_reader)

			for row in csv_reader:

				age_of_tree_str = row[0]
				product_type= row[1]
				color = row[2]
				expiration_date_str = row[3]
				apple_id = row[4]
				pollination_group = row[5]
				category = row[6]
				tree_id = row[7]
				variety = row[8]
				
			
				expiration_date = datetime.datetime.strptime(expiration_date_str, "%Y-%m-%d")
				age_of_tree = int(age_of_tree_str[0:2])
				
				apple = Apple(apple_id = int(apple_id),
						expiration_date = expiration_date,
						age_of_tree= int(age_of_tree),
	    				tree_id = int(tree_id),
	    				variety = variety,
	    				pollination_group= pollination_group,
	    				color = color
	    				)   
				db.session.add(apple)

		db.session.commit()


def load_banana_fruits():

	bananarama_list = glob.glob("Bananarama/*.csv")
	print("Got this far")
	for filename in bananarama_list:
		with open(filename) as csv_file:
			csv_reader = csv.reader(csv_file, delimiter=',')
			next(csv_reader)

			for row in csv_reader:

				expiration_date_str = row[1]
				generation_number = row[2]
				banana_id = row[3]
				tree_id = row[5]
				variety = row[6]
				
			
				expiration_date = datetime.datetime.strptime(expiration_date_str, "%Y-%m-%d")
				
				banana = Banana(banana_id = int(banana_id),
						expiration_date = expiration_date,
	    				tree_id = int(tree_id),
	    				variety = variety,
	    				generation_number = int(generation_number),
	    				)   
				db.session.add(banana)

		db.session.commit()

def load_milk():

	milk_list = glob.glob("old_macdonald/*.csv")
	print("Got this far")
	for filename in milk_list:
		with open(filename) as csv_file:
			csv_reader = csv.reader(csv_file, delimiter=',')
			next(csv_reader)

			for row in csv_reader:
				cartons = row[0]
				cow_id = row[2]
				cow_age_str = row[3]
				cow_breed = row[4]
				expiration_date_str= row[5]
				vendor = row[6]
			
				expiration_date = datetime.datetime.strptime(expiration_date_str, "%Y-%m-%d")
				cow_age = int(cow_age_str[0:2])
				
				milk = Milk(cow_id = int(cow_id),
						expiration_date = expiration_date,
	    				cartons = int(cartons),
	    				cow_age = cow_age,
	    				cow_breed = cow_breed,
	    				vendor = vendor,
	    				)   
				db.session.add(milk)

		db.session.commit()

def load_butter():

	butter_list = glob.glob("spring_butter_logs/*.csv")
	for filename in butter_list:
		with open(filename) as csv_file:
			csv_reader = csv.reader(csv_file, delimiter=',')
			next(csv_reader)

			for row in csv_reader:
				number_sticks = row[0]
				cow_id_str = row[1] 
				carton_str = row[1]
				churner = row[3]
				expiration_date_str = row[4]

				expiration_date = datetime.datetime.strptime(expiration_date_str, "%Y-%m-%d")
				cow_id = cow_id_str[4:8]
				carton = carton_str[10:]

				butter = Butter(number_sticks = number_sticks,
							expiration_date = expiration_date,
							cow_id = int(cow_id),
							carton = carton,
							churner = churner
							)
				db.session.add(butter)
		db.session.commit()

def load_sales():

	sales_list = glob.glob("sales/*.csv")
	for filename in sales_list:
		with open(filename) as csv_file:
			csv_reader = csv.reader(csv_file, delimiter = ',')
			next(csv_reader)

			for row in csv_reader:
				price_str = row[0]
				customer_name = row[1]
				item_purchased = row[2]

				price = float(price_str[1:])

				sale = Sales(
					price_of_purchase = price,
					customer_name = customer_name,
					item_purchased = int(item_purchased)
					)
				db.session.add(sale)
		db.session.commit()



if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    load_apple_fruits()
    load_banana_fruits()
    load_milk()
    load_butter()
    load_sales()



