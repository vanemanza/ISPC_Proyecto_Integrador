class Rifador:

    id_rifador = int
    nombre = str
    dni = str
    telefono = str
    password = str
    cbu = str
    redes_sociales = str
    id_usuario = int

    def __init__(self, id_rifador, nombre):
        self.id_rifador = id_rifador
        self.nombre = nombre

    def __str__(self):
        return f"{self.id_rifador} - {self.nombre}"        

    def iniciar_sesion(self):
        # queda pendiente para cuando tengamos la conexion con la bd
        pass

    def cerrar_sesion(self):
        # queda pendiente para cuando tengamos la conexion con la bd
        pass
    

# creo instancias de rifador para usar de ejemplos de prueba
# 
# rifador_uno = Rifador(1, "Rifador Uno")
# rifador_dos = Rifador(2, "Rifador Dos")

# print(rifador_uno.nombre, rifador_dos.nombre)