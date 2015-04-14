# Sobre cual distribución vamos a trabajar
FROM    centos:centos6

# Dependencias para NodeJS
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Instalar Node.js and npm
RUN     yum install -y npm

# Instalando nodemon
RUN     npm -g install nodemon

# Copiando el contenido del repo hacia la carpeta "src"
COPY    . /src

# Instalando dependencias
RUN     cd /src; npm install

# Haciendo público el puerto 3000
EXPOSE  3000

# Iniciando el servidor
CMD     ["nodemon", "/src/bin/www"]

#docker build -t leopic/componentes-servidor-node /Users/leo/Sites/componentes/servidorNode
#docker run --name servidor-node -p 4002:3000 -d -v /Users/leo/Sites/componentes/servidorNode:/src leopic/componentes-servidor-node
#docker logs -tf servidor-node
