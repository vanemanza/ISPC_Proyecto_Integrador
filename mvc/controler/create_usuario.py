import mysql.connector
try:
        connection=mysql.connector.connect(
            host='localhost',
            port='3306',
            db='mirifa',
            user='root',
            password='Rosamonte84')
        cursor = connection.cursor()
        sentenciaSQL= "INSERT INTO usuario(email,password,login_status,id_plan) VALUES (%s,%s,%s,%s);"
        data= ('admin@mirifa.net', 'adminMiRifa', 'A', 1)

        cursor.execute(sentenciaSQL,data)
        connection.commit()
        print("Se agrego con exito el Usuario")
        
except mysql.connector.Error as error:
	print ("Error, no se puedo conectar a la base de datos.", error)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.") 