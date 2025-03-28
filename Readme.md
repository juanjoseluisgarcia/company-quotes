# Glass Lewis Senior Full Stack .Net Software Engineer - Code Challenge

## Introduction


The rest request several requirements. 
- It has to read and write from a database.
- It has to run end to end.
- It needs to provide SQL Scripts.

To satisfy this requirements without being too laborius I have decided that solution will be containarised in three Docker containers:
- Api
- PostgreSQL
- Web

The reason for this is that it eliminates laborius set up and issues with Database vendor, versioning, etc. 


## Solution requirements

For this solution to run is to have Docker Desktop installed in our machine. We can install it in [Windows](https://docs.docker.com/desktop/setup/install/windows-install/), [macOS](https://docs.docker.com/desktop/setup/install/mac-install/) or [Linux](https://docs.docker.com/desktop/setup/install/linux/).

We also need git to be able to clone the repository.


## Running the solution.

We clone with git:

```bash
git clone https://github.com/juanjoseluisgarcia/company-quotes.git
```

Then we chhange to the directory where we cloned the repo and we make sure Docker Desktop is running. And we type

```bash
docker compose build
```

and then we type:

```bash
docker compose up -d 
```

Then we can open in a browser the web application on the URL [http://localhost](http://localhost) and we can test the API in the URL [http://localhost:3000/swagger](http://localhost:3000/swagger)

## Description of the containers.

### PostgreSQL 

The PostgreSQL will be seeded with two scripts, one to create the database and two to create the table. For the sake of this test I did not separated a Company in multiple tables. It might have made sense to separate the field Exchange and to have a list of all exchanges. But I intended to keep this technical test simple. In a real life scenario we should have a list of exchanges. 

### Api

This solution is a .NET application as requested and since it is specifaly said that it needs to be in .NET Core /6+ I have opted to use the new minimal hosting API rather than the previous MVC approach that offers a much more streamlined approach. 


After some careful consideration, I have opted out of `EF Core` and I have gone with `Dapper` as my main library for data access alongside `Npgsql` for PostgreSQL. Since I did not want to start writting SQL queries in the code, as some, argue is *less* maintaneable than with a full fledge ORM I have opted to also include `Dapper.FastCrud` (see this [link](https://dappertutorial.net/dapper-fastcrud) for those unfamiliar with this library) that offers a minimalistic Object to Entity approach. 

#### Authentiucation

Since it was asked as *nice to have* some level of authentication, and for the sake of a technical test, I have hardcoded a user and a password as well as a SHA-256 key to generate a JWT token. I did not want to over complicate this test with a full fledge OpenID Connect solution or SAML integration. I opted to keep things simple. In the UI I call the login endpoint, take the token and pass it as a bearer token to the API. In swagger I have enable Swagger authorization and the endpoint ready to generate the token, so the user can simply copy the token to the authorize section in Swagger. 

#### Separation of concerns.

To avoid leaking any dependency I implemented a repository pattern and I combined with a factory pattern, although, some argue that singleton is in fact and *anti-patern* to avoid to leak Dapper into the main API project or any other that are not unit tests. 

The repository implements a company deletion, but since it was not asked I decided to not publish a `DELETE` endpoint.

#### About running it "locally".

The solution can be run via command line or IDE outside its container for debugging purposes and proper enviroment variables have been set in the code and in the Docker container to allow this, but in Windows, to run the solution it needs to be run as administrator, since it binds a port in the `0.0.0.0` address to allow to listen externally. Docker does not shows this behaviour and it have to do more with the Windows architechture than the solutuin itself

### Web

The application is a very rudimentary SPA in React to show a table with some styling, only calling the `/api/companies` (previous the `/login` endpoint) and no others to conform the "very simple" client requested. I can add more APIs and components if requested. I used Typescript in this occasion.

Other Javascript frameworks I am familiar with are, Angular, VueJS and Sveltekit. 

# Conclusion
I am free for additional requests, or queries. 


