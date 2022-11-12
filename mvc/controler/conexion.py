import mysql.connector
from mysql.connector import Error
try:
	connection=mysql.connector.connect(
        host='localhost',
        port='3306',
        db='mirifa',
        user='root',
        password='Rosamonte84')  #Cambiar password
	if connection.is_connected():
			db_Info=connection.get_server_info()
			print("Conexion Exitosa", db_Info)
			cursor=connection.cursor()
			cursor.execute("select database();")
			record=cursor.fetchone()
			print("You're connected to database: ", record)
except Error as e:
	print ("Error, no se puedo conectar a la base de datos.", e)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.") 