# README

# Registration

## Requisitos

- Ruby (versión 3.2.2)
- Rails (versión 7.1.3)
- wkhtmltopdf 0.12.6

## Configuración

1. Dirígete a la ubicacion donde quieres clonar el proyecto por medio de CMD.

2. Clona el repositorio:

Ejecuta: git clone git@github.com:brayannuvi/Registration.git

3. En el caso de usar un sistema operativo windows instalar wkhtmltopdf por medio de la pagina oficial https://wkhtmltopdf.org/downloads.html, en caso de usar otro sistema operativo sera necesario la inclusion de la gema gem 'wkhtmltopdf-binary' en el archivo Gemfile

4. Dirígete a la carpeta del proyecto que acabas de clonar por medio de CMD.

5. Instala las dependencias:

Ejecuta: bundle install

6. Luego en la ruta app/config/initializers/wicked_pdf.rb estableceras la ruta de acceso a wkhtmltopdf.exe en el campo exe_path:

7. Configura la base de datos desde la ruta principal del proyecto:

Ejecuta: rails db:migrate

8. Brinda permisos de Control total a la ruta que lleva al proyecto que clonaste.

## Uso

1. Dirígete a la carpeta del proyecto por medio de CMD.

2. Ejecuta: rails server

3. Abre tu navegador y ve a http://localhost:3000.
