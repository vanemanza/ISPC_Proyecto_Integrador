import mysql.connector
try:
        connection=mysql.connector.connect(
            host='localhost',
            port='3306',
            db='mirifa',
            user='root',
            password='')
        cursor = connection.cursor()
        sentenciaSQL= "SELECT * from plan;"
        
        cursor.execute(sentenciaSQL)
        resultadoREAD = cursor.fetchall()
        print("Se encontro los siguientes planes: ",resultadoREAD)
        
except mysql.connector.Error as error:
	print ("Error, no se puedo conectar a la base de datos.", error)
finally:
	if connection.is_connected():
		cursor.close()
		connection.close()
		print("Conexion MySQL, cerrada.")