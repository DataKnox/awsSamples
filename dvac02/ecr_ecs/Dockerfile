FROM --platform=linux/amd64 node as build

WORKDIR /react-app


COPY package*.json ./


RUN yarn install


COPY . .


RUN yarn run build


FROM nginx


COPY ./nginx/nginx.conf /etc/nginx/nginx.conf


COPY --from=build /react-app/build /usr/share/nginx/html