class Creator < User

# Validaciones específicas para Creator

  # Ejemplo: los creadores deben estar activos
  validates :active, acceptance: { accept: true, message: "Creator must be active" }

  # Puedes agregar otros métodos o validaciones específicas
   
end