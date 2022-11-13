from planes import Plan

class Usuario:
    
    email = str
    password = str
    login_status = str
    id_plan = int #ver como indico q es foreignkey de plan
    lista_usuarios = []

    def __init__(self, email, password):        
        self.email = email
        self.password = password

    def __str__(self):
        return f"{self.email} - {self.password}"        

    def iniciar_sesion(self):
        # queda pendiente para cuando tengamos la conexion con la bd
        pass

    def cerrar_sesion(self):
        # queda pendiente para cuando tengamos la conexion con la bd
        pass

    def elegir_plan(self, id_plan):
        if not isinstance(id_plan, Plan):
            raise Exception('No es posible elegir este plan.')
        else:
            self.elegir_plan(id_plan)
            self.elegir_plan.save()    

# def registrar_usuarios():
#     # instancia de usuario para probar
#     usuario_uno = Usuario("usuario_uno@mail.com", "password_uno")
#     usuario_dos = Usuario("usuario_dos@mail.com", "password_dos")  
#     Usuario.lista_usuarios.append(usuario_uno)
#     Usuario.lista_usuarios.append(usuario_dos)

# def main():
#     registrar_usuarios()    
    
# if __name__ is "__main__":
#     main()

# print(usuario_uno.email, usuario_dos.email)
# print(plan)
