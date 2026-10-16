Estado Inicial (Sin Normalizar): Se recolectaban todos los datos en un único formato en papel donde un cliente tenía escritas varias mascotas en renglones adyacentes, y en las consultas se listaban múltiples medicamentos en un solo campo de texto.   

Primera Forma Normal (1FN): Se eliminan los grupos repetitivos. Se independizan los datos atómicos y se crean claves primarias para identificar cada registro de manera única.

Segunda Forma Normal (2FN): Se elimina la dependencia parcial. Atributos como los datos del cliente se separan de las mascotas, y los datos de las recetas se separan de los medicamentos mediante la tabla DetalleReceta

Tercera Forma Normal (3FN): Se eliminan las dependencias transitivas. Atributos no clave como los datos del veterinario no dependen de la consulta ni de la mascota, por lo que Veterinarios se aísla en su propia entidad.   
