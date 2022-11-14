class Plan:

    id_plan = int
    titulo = str
    descripcion = str

    def __init__(self, id_plan, titulo):
        self.id_plan = id_plan
        self.titulo = titulo
        
# instancia de plan
# plan_basico = Plan(112, "Plan Básico")   
# plan_mejorado = Plan(212, "Plan Mejorado")   
# plan_premium = Plan(312, "Plan Premium")   

# print(plan_basico.titulo, plan_mejorado.titulo, plan_premium.titulo)