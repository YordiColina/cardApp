# card_app

A new Flutter project.

## Descripción
Esta es una aplicación Flutter destinada a la creación, actualización y eliminacion de cards de presentación de cualquier producto.

## Estructura del Proyecto
La aplicación sigue una arquitectura limpia, utilizando  `Riverpod` para manejar el estado y la lógica de negocio. El proyecto está dividido en las siguientes capas mediante segregación de carpetas:
- **domain**: Contiene los entities con su respectivo modelo y su repository,los usecases con su referencia al repository.
- **infraestructure**: Contiene nuestros driven adapters que en este caso implementan una BD local(sqflite), con su respectiva carpeta de helpers y de errors, accediendo solo a la capa de dominio mediante el repository.
- **presentation**: Contiene las vistas o pantallas de la aplicación (FormScreen, HomeScreen,DetailsScreen) y una carpeta common para manejar widgets comunes en ausencia de un sistema de diseño y solo accede a la capa de dominio.
- **config**: Contiene los providers de Riverpod para manejar el estado de la aplicación y los notifier.

## Funcionalidades Principales
- Visualizar en cards información relacionada al negocio.
- Crear una nueva card.
- Editar una card existente.
- Eliminar una card existente.

## Consideraciones
- la aplicación usa una animación global para la transición entre pantallas, personalizada para android en este caso.
- la aplicación usa  la librería 'Go router' para manejar la navegación entre pantallas.
- la aplicación usa sqflite para la persistencia de datos.
- la aplicación usa la librería 'UUID' para generar un id único para cada card y hacer el registro en la bd.
- la aplicación usa la librería 'Logger' para hacer logs mas destacados en la consola y evitar el uso de prints.
- la aplicación en el itemNotifier crea dos cards por defecto al iniciar la aplicación como una muestra o ejemplo.
