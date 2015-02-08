#MeteorD - Docker Runtime for Meteor Apps

There are two ways you can build Meteor apps for Docker. They are:

1. Docker image for each version of your app
2. Running a Meteor bundle with docker

MeteorD supports these two ways. Let's see how to do it.

## 1. Docker image for each version of your app

With this setup, you can use `meteorhacks/meteord` as your base image. You can simply add following Dockerfile into the root of your app to build a image for your app.

~~~shell
FROM meteorhacks/meteord
MAINTAINER Your Name

COPY ./ /app
RUN meteord-build
~~~

Then you can build the app with:

~~~shell
docker build -t yourname/app .
~~~

Then you can run your meteor image with

~~~shell
docker run -d \
    -e ROOT_URL=http://yourapp.com \
    -e MONGO_URL=mongodb://url \
    -e MONGO_OPLOG_URL=mongodb://oplog_url \
    -p 80:3000 \
    yourname/app 
~~~

Then you can access your from the port 80 of the host.

## 2. Running a Meteor bundle with MeteorD

For this you can directly use the MeteorD to run your meteor bundle. MeteorD can accept your bundle either from the web or from a local mount. Let's see

### 2.1 From a Local Mount

~~~shell
docker run -d \
    -e ROOT_URL=http://yourapp.com \
    -e MONGO_URL=mongodb://url \
    -e MONGO_OPLOG_URL=mongodb://oplog_url \
    -v /mybundle_dir:/bundle \
    -p 80:3000 \
    meteorhacks/meteord
~~~

With this, MeteorD expects your tar ball version of the bundle to be exists in `/bundle` volume. It should be build for `os.linux.x86_64`. This is how you can do it:

~~~shell
meteor build --architecture=os.linux.x86_64 ./
~~~


**Rebuilding Binary Modules**

Sometimes, you need to recompile binary modules. If so, expose `REBUILD_BINARY_MODULES` environment variable. If this is the case, it takes a few seconds for the compilations.

### 2.1 From the Web

You can also simply give URL of the tarball with `BUNDLE_URL` environment variable. This is how to do it:

~~~shell
docker run -d \
    -e ROOT_URL=http://yourapp.com \
    -e MONGO_URL=mongodb://url \
    -e MONGO_OPLOG_URL=mongodb://oplog_url \
    -e BUNDLE_URL=http://mybundle_url_at_s3.tar.gz \
    -p 80:3000 \
    meteorhacks/meteord
~~~

