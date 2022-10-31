from planes import Plan

class Usuario:

    id_usuario = int
    email = str
    password = str
    login_status = str
    id_plan = int #ver como indico q es foreignkey de plan

    def __init__(self, id_usuario, email, password):
        self.id_usuario = id_usuario
        self.email = email
        self.password = password

    # Métodos
    def elegir_plan(self, id_plan):
        if not isinstance(id_plan, Plan):
            raise Exception('No es posible elegir este plan.')
        else:
            self.elegir_plan(id_plan)
            self.elegir_plan.save()    

    
# instancia de usuario para probar
# usuario_uno = Usuario(11, "usuario_uno@mail.com", "password_uno")
# usuario_dos = Usuario(22, "usuario_dos@mail.com", "password_dos")    
# plan = usuario_uno.id_plan(112)
# print(usuario_uno.email, usuario_dos.email)
# print(plan)