import mysql.connector
try:
        connection=mysql.connector.connect(
            host='localhost',
            port='3306',
            db='mirifa',
            user='root',
            password='')
        
        sentenciaSQL= "UPDATE usuario SET email='administracion@mirifa.net' WHERE email like 'admin@mirifa.net';"
        cursor = connection.cursor()
        cursor.execute(sentenciaSQL)
        connection.commit()
        print("Se actualiza el usuario correctamente")
        
except mysql.connector.Error as error:
	print ("Error, no se puedo conectar a la base de datos.", error)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.")