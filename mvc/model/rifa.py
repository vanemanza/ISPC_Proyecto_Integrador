# aca van los modelos de la bd
from datetime import date
from rifador import *
from visitantes import *
from pagos import *

class Rifa:
    # Atributos
    id = int
    titulo = str
    id_rifador = int
    id_premio = int
    cantidad_numeros = int
    valor_numero = int
    fecha_sorteo = date
    medio_pago = str #sería un atributo de vender/comprar rifa o de sorteo? por ahora es fk con pagos
    #cbu = int #cbu no es un atributo de la rifa, sería un atributo de los medios de pago
    #banco = str #banco tampoco es un atributo de la rifa, podria  serlo del medio de pago
    #telefono = 0 #no es un atributo de la rifa, podria ser un atributo del rifador o del comprador

    # Métodos
    def __init__ (self, id, titulo, id_rifador):
        self.id=id
        self.titulo=titulo
        self.id_rifador=id_rifador
      
    def crear_rifa(self, id, id_premio, cantidad_numeros, valor_numero, fecha_sorteo):
        pass

    def ver_rifa(self, id):
        pass

    def actualizar_rifa(self, id):
        pass

    def eliminar_rifa(self, id):
        pass

    def agregar_medio_pago(self, id):
        if not isinstance(id, Medios_de_Pago):
            raise Exception("no es posible elegir este medio de pago")
        else:
            self.agregar_medio_pago(id)
            self.agregar_medio_pago.save()


# Instancia de un objeto rifa como ejemplo
# rifa_uno = Rifa(111, "titulo_rifa_uno", rifador_uno)
# rifa_uno.agregar_medio_pago(debito)
# print(rifa_uno.id, rifa_uno.titulo, rifa_uno.id_rifador)    
# print(rifa_uno.medio_pago)

class Numero:

    numero = int
    id_visitante = int
    id_rifa = int

    def __init__(self, numero, id_visitante, id_rifa):
        self.numero = numero
        self.id_visitante = id_visitante
        self.id_rifa = id_rifa

# numero_uno = Numero(400, visitante_uno, rifa_uno) 
# print(numero_uno.numero)       

