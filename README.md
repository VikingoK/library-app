# 📚 Librery App

Librery App es una aplicación desarrollada en Flutter con arquitectura limpia. Este repositorio incluye el código fuente, un video demostrativo, un APK para instalación y el diseño original de la aplicación.

## 📌 Funcionalidades Implementadas

- 📚 **Pantalla de inicio** : Muestra los nuevos libros lanzados.
- 🔎 **Búsqueda de libros**: Permite ingresar el nombre del libro para consultarlo.
- 📚 **Listado de resultados**: Muestra los libros encontrados según la búsqueda.
- 📖 **Detalle del libro**: Al seleccionar un libro, se muestra su información junto con la imagen asociada y navegación hacia la pagina web del libro.
- ⚡ **Caché de búsquedas**: Almacena en memoria caché los últimos 5 términos de búsqueda para agilizar futuras consultas.
- 🛠 **Arquitectura limpia y pruebas**: Implementada en Flutter siguiendo arquitectura limpia e incluyendo pruebas unitarias.

## 🚀 Tecnologías utilizadas

- **Flutter** 3.24.3 (stable)
- **Dart** 3.5.3
- **DevTools** 2.37.3

## 📂 Estructura del proyecto

El proyecto sigue la arquitectura limpia (Clean Architecture), dividiendo el código en capas:

- **core/** → Contiene configuraciones generales, temas y widgets reutilizables.
- **features/** → Contiene las funcionalidades principales de la app, divididas en "domain", "data" y "presentation".

## ⚙️ Instalación y configuración

Sigue estos pasos para configurar y ejecutar el proyecto correctamente:

1. **Clonar el repositorio:**
   ```sh
   git clone https://github.com/VikingoK/library-app.git
   cd librery_app
   ```

2. **Instalar dependencias:**
   ```sh
   flutter pub get
   ```

3. **Generar archivos necesarios con build_runner:**
   ```sh
   dart run build_runner watch
   ```
   Este comando es fundamental, ya que se encarga de generar los archivos necesarios para que el proyecto funcione correctamente.

4. **Ejecutar la aplicación:**
   ```sh
   flutter run
   ```

## Arquitectura en la Nube
La siguiente imagen representa la arquitectura en la nube de la aplicación, utilizando servicios de AWS para gestionar la información de los libros y optimizar las búsquedas.
<img width="963" alt="Arquitectura_nube" src="https://github.com/user-attachments/assets/e19ee01f-d905-4685-b2cb-d312a79c7f9a" />


## 📹 Recursos disponibles

- **Video demostrativo:**
https://github.com/user-attachments/assets/30227345-ac41-45da-aa99-40b72d5b8240

- **APK para pruebas:**
El apk se encuentra dentro del proyecto en la raiz del mismo con el nombre de library_app.apk

- **Diseño creado para la app:**
![desing_library_app](https://github.com/user-attachments/assets/0c75ba78-3087-4d90-8d54-d907c232171c)

## 🛠️ Herramientas adicionales

Si deseas ejecutar pruebas o analizar el código, puedes usar los siguientes comandos:

- **Ejecutar pruebas:**
  ```sh
  flutter test
  ```

---
Si tienes alguna pregunta sobre la implementación o el proyecto, puedes contactarme a través de mi correo.
