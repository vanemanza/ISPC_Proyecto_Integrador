import mysql.connector
try:
        connection=mysql.connector.connect(
            host='localhost',
            port='3306',
            db='mirifa',
            user='root',
            password='Rosamonte84')
        cursor = connection.cursor()
        sentenciaSQL = "DELETE from usuario where email like 'admin@mirifa.net'"

        cursor.execute(sentenciaSQL)
        connection.commit()
        print("Se elimino con exito el Usuario")
        
except mysql.connector.Error as error:
	print ("Error, no se puedo conectar a la base de datos.", error)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.") 