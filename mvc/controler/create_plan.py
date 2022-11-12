import mysql.connector
try:
        connection=mysql.connector.connect(
            host='localhost',
            port='3306',
            db='mirifa',
            user='root',
            password='Rosamonte84')
        cursor = connection.cursor()
        sentenciaSQL= "insert into plan (id_plan, titulo, descripcion) VALUES (%s,%s,%s);"
        data= (1,"Basico","Gratis")

        cursor.execute(sentenciaSQL,data)
        connection.commit()
        print("Se agrego con exito el Plan")

        
except mysql.connector.Error as error:
	print ("Error, no se puedo conectar a la base de datos.", error)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.") 