## Instructions: 

I sent a zip file of the directory to be unzipped. The application uses Python, Flask, SQLAlchemy, and Postgres. The usual Python/Flask setup is required.

--------------------------------------------------------------------------------------------------------

server $ cd spring_grocery
server $ virtualenv env
server $ source env/bin/activate

server (env) $ pip3 install -r requirements.txt

_________________________________________________________________________________________________________

The home page at http://0.0.0.0:5000/ of the application shows inventory totals and allows the user to update milk inventory based on butter production, delete expired items based on today’s date, and delete sold fruits from the inventory. The other pages list the items in those categories. The sales page gives information about sales. s
