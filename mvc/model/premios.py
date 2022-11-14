from emprendedor import *

class Premio:   

    premios_totales = [] 
   
    def __init__(self):       
       
        self.paquete = {
            'emprendedor':int,
            'premios': []
        }
       

    def agregar_premios(self, emprendedor, *premios):

        if len(premios) != 3:
            raise Exception(f'Se debe ingresar un total de 3 premios.')
        self.paquete = {
            'emprendedor':emprendedor,
            'premios': [premio for premio in premios]
        }    
       
        Premio.premios_totales.append(self.paquete)
        

    def __str__(self):
        final = self.premios_totales
        return print(f'***** final {final}')
        #return f'El emprendedor n° {self.emprendedor} aportó los siguientes premios: {self.paquete_de_premios}'        

premio1 = Premio()
print(premio1.premios_totales)
premio1.agregar_premios(501, 'bicicleta', 'laptop', 'boucher')
print(premio1.premios_totales)
premio2 = Premio()
premio2.agregar_premios(502, 'premio1', 'premio2', 'premio3')
print(Premio.premios_totales)