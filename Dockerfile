# Usa Node 20 ligero
FROM node:20-alpine

# Carpeta de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiamos package.json y package-lock.json si existe
COPY package*.json ./

# Instalamos dependencias (sin dev, para producción)
RUN npm ci --omit=dev

# Copiamos el resto del código
COPY . .

# Puerto interno de la app
ENV PORT=3000
EXPOSE 3000

# Comando para arrancar la app
CMD ["npm", "start"]
