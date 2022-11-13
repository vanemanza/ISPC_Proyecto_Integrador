class Medios_de_Pago:

    id_medio_pago = int
    tipo = str # mas adelante se puede agregar choices(debito, transferencia, billetera virtual)
    
    # para modificar en el der, el medio de pago deberia tener relacion con el rifador x el cbu?

    def __init__(self, id, tipo):
        self.id_medio_pago = id
        self.tipo = tipo
        

# instancias de medios de pago
# transferencia = Medios_de_Pago(900, "transferencia")
# debito = Medios_de_Pago(901, "debito")
# billetera_virtual = Medios_de_Pago(902, "billetera virtual")

# print(transferencia.tipo, debito.tipo, billetera_virtual.tipo)