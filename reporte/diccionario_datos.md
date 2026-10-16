# Diccionario de Datos - Base de Datos Veterinaria

### Tabla: Clientes
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_cliente` | Identificador único del cliente | INT | - | No | Sí | No | IDENTITY(1,1) |
| `nombre` | Nombre completo del propietario | VARCHAR | 100 | No | No | No | - |
| `telefono` | Teléfono de contacto | VARCHAR | 15 | No | No | No | - |
| `email` | Correo electrónico | VARCHAR | 100 | No | No | No | UNIQUE |
| `direccion` | Dirección física | VARCHAR | 200 | No | No | No | - |

### Tabla: Mascotas
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_mascota` | Identificador único de la mascota | INT | - | No | Sí | No | IDENTITY(1,1) |
| `nombre` | Nombre de la mascota | VARCHAR | 50 | No | No | No | - |
| `especie` | Especie (Perro, Gato, etc.) | VARCHAR | 30 | No | No | No | - |
| `raza` | Raza de la mascota | VARCHAR | 50 | No | No | No | - |
| `fecha_nacimiento` | Fecha de nacimiento | DATE | - | No | No | No | - |
| `id_cliente` | Clave foránea del propietario | INT | - | No | No | Sí | FK -> Clientes |

### Tabla: Veterinarios
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_veterinario` | Identificador único del veterinario | INT | - | No | Sí | No | IDENTITY(1,1) |
| `nombre` | Nombre completo del médico | VARCHAR | 100 | No | No | No | - |
| `cedula` | Cédula profesional | VARCHAR | 20 | No | No | No | UNIQUE |
| `telefono` | Teléfono de contacto | VARCHAR | 15 | No | No | No | - |

### Tabla: Consultas
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_consulta` | Identificador de la consulta | INT | - | No | Sí | No | IDENTITY(1,1) |
| `fecha_hora` | Fecha y hora de la atención | DATETIME | - | No | No | No | - |
| `motivo` | Razón de la visita | VARCHAR | 255 | No | No | No | - |
| `diagnostico` | Diagnóstico médico | VARCHAR | 500 | No | No | No | - |
| `tratamiento` | Tratamiento indicado | VARCHAR | 500 | No | No | No | - |
| `id_mascota` | Mascota atendida | INT | - | No | No | Sí | FK -> Mascotas |
| `id_veterinario` | Veterinario responsable | INT | - | No | No | Sí | FK -> Veterinarios |

### Tabla: Recetas
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_receta` | Identificador de la receta | INT | - | No | Sí | No | IDENTITY(1,1) |
| `fecha` | Fecha de emisión | DATE | - | No | No | No | - |
| `id_consulta` | Consulta asociada | INT | - | No | No | Sí | UNIQUE, FK -> Consultas |

### Tabla: Medicamentos
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_medicamento` | Identificador del medicamento | INT | - | No | Sí | No | IDENTITY(1,1) |
| `nombre` | Nombre del fármaco | VARCHAR | 100 | No | No | No | - |
| `descripcion` | Descripción o presentación | VARCHAR | 200 | Sí | No | No | - |

### Tabla: DetalleReceta
| Campo | Descripción | Tipo de Dato | Longitud | Permite NULL | PK | FK | Restricción |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `id_receta` | Clave foránea de la receta | INT | - | No | Sí | Sí | FK -> Recetas |
| `id_medicamento` | Clave foránea del medicamento | INT | - | No | Sí | Sí | FK -> Medicamentos |
| `dosis` | Dosis prescrita | VARCHAR | 100 | No | No | No | - |
| `indicaciones` | Frecuencia y duración | VARCHAR | 255 | No | No | No | - |