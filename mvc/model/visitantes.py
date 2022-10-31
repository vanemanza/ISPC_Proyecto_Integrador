class Visitante:

    id_visitante = int
    nombre = str
    email = str
    nros_comprados = list
    comprobante = int #no se que tipo de dato debería ser, quizas un int con el numero de comprobante

    def __init__(self, id_visitante, nombre, email):

        self.id_visitante = id_visitante
        self.nombre = nombre
        self.email = email

# se instancias visitantes para usar en los otros modelos
# visitante_uno = Visitante(311, "Juana Perez", "uno@mail.com")        
# visitante_dos = Visitante(322, "Maria Lopez", "dos@mail.com")      
# visitante_tres = Visitante(333, "Paola Jerez", "tres@mail.com")      

# print(f'{visitante_uno.nombre}, {visitante_dos.nombre}, {visitante_tres.nombre}')