# Kickstart Strapi.io and Next.js

__Next.js__

Website: https://nextjs.org/

Documentation: https://nextjs.org/docs/

Github: https://github.com/zeit/next.js

__Strapi.io__

Website: https://strapi.io

Documentation: https://strapi.io/documentation/

Github: https://github.com/strapi/strapi


## depends on
* node >= 10
* npm >= 6
* docker >= 18.02.0
* make

## Init a new project

__1. Install strapi cli__
```bash
npm install strapi@alpha -g
```

__2. Init strapi and next__
```bash
make init
```
Than folow the instructions and edit the *./app/package.json* to add the scripts section.
```` json
{
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start"
  }
}
```` 

__3. Start docker, strapi and next.js__
```bash
make up
```

Stop docker, strapi and next.js
```bash
make down
```

## Urls

#### App: (next.js)

* App: http://localhost:3000

#### Backend: (strapi)

* Admin: http://localhost:1337/adminer
* Static frontend: http://localhost:1337
* REST: http://localhost:1337/myApi
* GraphQL (Playground): http://localhost:1337/graphql
* Documentation (Swagger): http://localhost:1337/documentation/v1.0.0
