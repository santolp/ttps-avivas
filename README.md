# ttps-avivas
Trabajo integrador de la materia TTPS - UNLP


# Sistema de Gestión de Ventas

## Requisitos

Para el siguiente proyecto usaremos 
    • La versión estable más reciente del framework Ruby on Rails (8.0.0 al momento de escribir
    este documento).
    • Una versión reciente de Ruby (3.2.0 o superior), acorde a lo requerido por el framework.
    • Una base de datos SQLite para dar soporte de persistencia.

- Ruby 3.2.0
- Rails 8.x
- SQLite
- Node.js
- Yarn o npm
- Bundler

## Instalación

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/santolp/ttps-avivas.git
   cd ttps-avivas
   ```

2. Instalar dependencias:
   ```bash
   bundle install
   yarn install
   ```

3. Configurar la base de datos:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Levantar el servidor:
   ```bash
   rails server
   ```

5. Acceder al proyecto en el navegador:
   ```
   http://localhost:3000
   ```

## Usuarios de Prueba
• Gestión de usuarios: un sistema de autenticación y autorización que permita a los empleados
de la cadena acceder a las interfaces de administración. Ver apartado Gestión de usuarios.


- **Admin**  
  - Email: `admin@avivas.com`  
  - Contraseña: `admin123`

- **Gerente**  
  - Email: `gerente@avivas.com`  
  - Contraseña: `gerente123`

- **Empleado**  
  - Email: `empleado@avivas.com`  
  - Contraseña: `empleado123`



////////////////////////////////////////////////////

• Storefront: un sitio web público que permita a los visitantes ver los productos disponibles y con‑
sultar su precio. No es requerido que además puedan realizarse compras, pero sí que se pueda
ver el stock disponible

• Administración de productos: una interfaz de administración que permita a los empleados de la
cadena gestionar los productos, su stock y su precio. Ver apartado Administración de produc‑
tos.

• Administración de ventas: una interfaz de administración que permita a los empleados de la
cadena registrar las ventas realizadas y los productos vendidos. Ver apartado Administración
de ventas.



////////////////////////////////////////////////////
Prerequisitos para MacOS

Instalacion de Rails ---> 

 
   Descripción general
Esto tomará alrededor de 30 minutos.

Configuraremos un entorno de desarrollo Ruby on Rails en macOS 15 Seqouia. Ruby puede ejecutarse en Apple Silicon como chips M1 y M2 y Macs Intel sin problemas. Esta guía lo guiará en la configuración de Ruby y Rails en Apple Silicon.

Instalación de Homebrew
Primero, necesitamos instalar Homebrew. Homebrew nos permite instalar y compilar paquetes de software fácilmente desde la fuente.

Homebrew viene con un script de instalación muy simple. Cuando le solicite que instale XCode CommandLine Tools, responda que sí.

Abra la Terminal y ejecute el siguiente comando:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
Instalación de Ruby
Primero, debemos instalar las dependencias de Ruby usando Homebrew.

brew install openssl@3 libyaml gmp rust
A continuación, instalaremos Ruby usando un administrador de versiones llamado Mise. Esto le permite actualizar Ruby fácilmente y cambiar entre versiones en cualquier momento.

curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.zshrc
source ~/.zshrc
Luego, instala Ruby con Mise:

mise use --global ruby@3
Confirma que Ruby esté instalado y funcione:

ruby --version
#=> 3.3.5
También debes asegurarte de que estás usando la última versión de Rubygems.

gem update --system
Opcionalmente, si planeas usar Node.js para manejar activos, también puedes usar Mise para instalar Node.

mise use --global node@22.11.0
node -v
#=> 22.11.0
Configuración de Git
Usaremos Git para nuestro sistema de control de versiones, por lo que lo configuraremos para que coincida con nuestra cuenta de Github. Si aún no tienes una cuenta de Github, asegúrate de registrarte. Te será útil en el futuro.

Reemplace el nombre y la dirección de correo electrónico de ejemplo en los siguientes pasos con los que utilizó para su cuenta de Github.

git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t ed25519 -C "YOUR@EMAIL.com"
El siguiente paso es tomar la clave SSH recién generada y agregarla a su cuenta de Github. Debe copiar y pegar el resultado del siguiente comando y pegarlo aquí.

cat ~/.ssh/id_ed25519.pub
Una vez que haya hecho esto, puede verificar si funcionó:

ssh -T git@github.com
Debería recibir un mensaje como este:

¡Hola, excid3! Se autenticó correctamente, pero GitHub no proporciona acceso al shell.
Instalación de Rails
Elige la versión de Rails que deseas instalar:

8.0.0 (recomendado)
Instalar Rails es tan simple como ejecutar el siguiente comando en tu terminal:

gem install rails -v 8.0.0
Y ahora podemos verificar que Rails está instalado:

rails -v
# Rails 8.0.0
Configuración de una base de datos
Rails viene con sqlite3 como base de datos predeterminada. También puedes usar MySQL o PostgreSQL si lo deseas.

MySQL
Puedes instalar el servidor y el cliente MySQL desde Homebrew:

brew install mysql
brew services start mysql
De manera predeterminada, el usuario mysql es root sin contraseña.

Cuando hayas terminado, puedes saltar a los pasos finales.

PostgreSQL
Puedes instalar el servidor y el cliente PostgreSQL desde Homebrew:

brew install postgresql
brew services start postgresql
De manera predeterminada, el usuario postgresql es tu nombre de usuario actual de macOS sin contraseña. Por ejemplo, mi usuario de macOS se llama chris, por lo que puedo iniciar sesión en postgresql con ese nombre de usuario.

#### Para instalar sqlite 
brew install sqlite

Pasos finales
Y ahora, el momento de la verdad. Vamos a crear tu primera aplicación Rails:

rails new myapp



#### Si quieres usar SQLite
rails new myapp -d sqlite

#### Si quieres usar MySQL
rails new myapp -d mysql

#### Si quieres usar Postgres
rails new myapp -d postgresql

# Muévete al directorio de la aplicación
cd myapp

bin/rails server
¡Ahora puedes visitar http://localhost:3000 para ver tu nuevo sitio web!

Ahora que tienes configurada tu máquina, es hora de comenzar a crear algunas aplicaciones Rails.

¿Te aparece un error de "Acceso denegado"?
Si recibiste un error que decía Acceso denegado para el usuario 'root'@'localhost' (usando contraseña: NO), entonces debes actualizar tu archivo config/database.yml para que coincida con el nombre de usuario y la contraseña de la base de datos.

Edición de código
Instala VS Code.

Luego, ejecuta Cmd+Shift+P y selecciona "Instalar el comando 'code' en PATH". Esto agregará el comando code a tu shell para que puedas abrir VS Code desde tu terminal.

Por último, ejecuta este comando para configurar VS Code como tu editor. Esto te permite editar las credenciales de Rails en tu terminal.

fuente: https://gorails.com/setup/macos/15-sequoia


///////// ----->  Windows 10 

Descripción general
Esto tomará alrededor de 30 minutos.

En esta guía, instalaremos Ruby on Rails en Windows 10.

Usaremos el Subsistema de Windows para Linux (WSL) para lograr esto. Esto le permite instalar una distribución de Linux de forma nativa en Windows sin una máquina virtual.

Ruby on Rails siempre se implementará en un servidor Linux, por lo que es mejor que usemos el mismo para el desarrollo.

Instalación del Subsistema de Windows para Linux
Windows le permite ejecutar varios sistemas operativos Linux dentro de Windows de forma similar a una máquina virtual, pero implementados de forma nativa. Lo usaremos para instalar Ruby y ejecutar nuestras aplicaciones Rails.

Debe ejecutar Windows 10 versión 2004 y superior (Build 19041 y superior) o Windows 11.

Abra PowerShell y ejecute:

wsl --install -d Ubuntu

Reinicie su computadora para finalizar la instalación.

Una vez que finalice la configuración inicial, se le solicitará que cree un nombre de usuario y una contraseña para su instalación de Ubuntu.

Puede buscar "Ubuntu" en el menú Inicio de Windows en cualquier momento para abrir la terminal de Ubuntu.

¡Felicitaciones! Ahora tiene instalado Ubuntu en Windows con WSL. Lo usará para ejecutar su servidor Rails y otros procesos para el desarrollo.

Instalación de Ruby
El primer paso es instalar las dependencias para compilar Ruby.

Abra su terminal y ejecute los siguientes comandos para instalarlas.

sudo apt-get update
sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev
A continuación, instalaremos Ruby utilizando un administrador de versiones llamado Mise. Esto le permite actualizar Ruby fácilmente y cambiar entre versiones en cualquier momento.

curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.bashrc
source ~/.bashrc
Luego, instala Ruby con Mise:

mise use --global ruby@3
Confirma que Ruby esté instalado y funcione:

ruby --version
#=> 3.3.5
También debes asegurarte de que estás usando la última versión de Rubygems.

gem update --system
Opcionalmente, si planeas usar Node.js para manejar activos, también puedes usar Mise para instalar Node.

mise use --global node@22.11.0

node -v
#=> 22.11.0
Configuración de Git
Usaremos Git para nuestro sistema de control de versiones, por lo que lo configuraremos para que coincida con nuestra cuenta de Github. Si aún no tienes una cuenta de Github, asegúrate de registrarte. Te será útil en el futuro.

Reemplace mi nombre y dirección de correo electrónico en los siguientes pasos con los que utilizó para su cuenta de Github.

git config --global color.ui true
git config --global user.name "TU NOMBRE"
git config --global user.email "TU@EMAIL.com"
ssh-keygen -t ed25519 -C "TU@EMAIL.com"
El siguiente paso es tomar la clave SSH recién generada y agregarla a su cuenta de Github. Debe copiar y pegar el resultado del siguiente comando y pegarlo aquí.

cat ~/.ssh/id_ed25519.pub
Una vez que haya hecho esto, puede verificar si funcionó:

ssh -T git@github.com
Debería recibir un mensaje como este:

¡Hola, excid3! Se autenticó correctamente, pero GitHub no proporciona acceso al shell.
Instalación de Rails
Elija la versión de Rails que desea instalar:

8.0.0 (recomendado)
gem install rails -v 8.0.0
Ahora que ha instalado Rails, puede ejecutar el comando rails -v para asegurarse de que todo esté instalado correctamente:

rails -v
# Rails 8.0.0
Si obtiene un resultado diferente por alguna razón, significa que su entorno puede no estar configurado correctamente.

Configuración de PostgreSQL
Para PostgreSQL, vamos a agregar un nuevo repositorio para instalar fácilmente una versión reciente de Postgres.

sudo apt install postgresql libpq-dev
sudo service postgresql start
Deberá iniciar postgresql cada vez que cargue su entorno WSL.

La instalación de postgres no configura un usuario para usted, por lo que deberá seguir estos pasos para crear un usuario con permiso para crear bases de datos. No dude en reemplazar chris con su nombre de usuario.

sudo -u postgres createuser chris -s
# Si desea establecer una contraseña para el usuario, puede hacer lo siguiente:
sudo -u postgres psql
postgres=# \password chris
Pasos finales
¡Creemos su primera aplicación Rails en Windows!

rails new myapp -d postgresql

#### O si desea utilizar MySQL
rails new myapp -d mysql

# Luego, vaya al directorio de la aplicación
cd myapp

# Si configura MySQL o Postgres con un nombre de usuario/contraseña, modifique el
# archivo config/database.yml para que contenga el nombre de usuario/contraseña que especificó

# Cree la base de datos
rake db:create

servidor rails
¡Ahora puede visitar http://localhost:3000 para ver su nuevo sitio web!

¿Obtiene un error de "Acceso denegado"?
Si recibiste un error que decía Acceso denegado para el usuario 'root'@'localhost' (usando contraseña: NO), entonces debes editar el archivo config/database.yml para que coincida con el nombre de usuario y la contraseña de la base de datos.

---> Instalar SQLite en Windows
Paso 1: vaya a la página de descarga de SQLite y descargue los binarios precompilados de la sección de Windows.

Paso 2: descargue los archivos comprimidos sqlite-shell-win32-*.zip y sqlite-dll-win32-*.zip.

Paso 3: cree una carpeta C:\>sqlite y descomprima los dos archivos comprimidos anteriores en esta carpeta, lo que le proporcionará los archivos sqlite3.def, sqlite3.dll y sqlite3.exe.

Paso 4: agregue C:\>sqlite en su variable de entorno PATH y, finalmente, vaya al símbolo del sistema y ejecute el comando sqlite3, que debería mostrar el siguiente resultado. 

C:\>sqlite3
Versión de SQLite 3.7.15.2 2013-01-09 11:53:05
Ingrese ".help" para obtener instrucciones
Ingrese instrucciones SQL terminadas con un ";"
sqlite>


fuente: https://www.tutorialspoint.com/sqlite/sqlite_installation.htm


Edición de código
Instala VS Code en Windows e instala la extensión WSL. Esto te permitirá editar código en Windows pero ejecutar comandos y extensiones en WSL. Lee más sobre Desarrollo en WSL.

¡Eso es todo! ¡Cuéntanos en los comentarios a continuación si tienes algún problema o tienes otros consejos profesionales para compartir!


fuente: https://gorails.com/setup/windows/10


