# plumbermd

this is a repository to demonstrate and explore construction of an API using plumber for R


there are 3 components to declaring an API with plumber: 
- the code to invoke, here encapsulated in the rmarkdown (.rmd) files
- the api declaration (api.R)
- the script that starts the http server and interprets api declaration (run.R)

The R scripts are wrapped in a docker image, defined by the Dockerfile. key aspects here are to
- install the dependencies
- copy the scripts
- direct the entrypoint to run the run.R script.

To take the result for a spin, have docker installed and run `docker build -t plumberdemo . ` in the project folder to build the docker image.
next, run `docker run -p 80:80 plumberdemo` to start the container. the api will be available on http://localhost

For example, `http://localhost/rmd` will process and generate html for the `example-r-markdown.rmd` file.
