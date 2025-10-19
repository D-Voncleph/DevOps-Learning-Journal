# Week 18 Summary: Building Images with Dockerfile

This week was a deep dive into creating my own container images. I learned the essential instructions that make up a `Dockerfile` (`FROM`, `WORKDIR`, `COPY`, `RUN`, and `CMD`) and, just as importantly, the best practices for writing them efficiently (like minimizing layers and leveraging the build cache).

The theory was immediately put into practice. I built two custom images:
1.  A simple `my-ubuntu-image` to practice the build process and learn how to use `docker exec` to get a shell inside a running container.
2.  A practical `fintech-app:v1` image that packages my static `index.html` file into an Nginx web server.

This week's work culminated in containerizing my first real project and documenting the process in my `docker-projects` repository.

---

## Project: FinTech App Dockerfile Explained

To understand exactly what I built, here is a line-by-line analysis of the `Dockerfile` for the `fintech-app` project.

### The `Dockerfile`

```dockerfile
# 1. Start from a lightweight Nginx base image
FROM nginx:alpine

# 2. Copy the local index.html into the Nginx web server's root directory
COPY index.html /usr/share/nginx/html

# 3. Expose port 80 (for documentation purposes)
EXPOSE 80
```



### Purpose of Each Line
`FROM nginx:alpine`

- Purpose: This is the FROM instruction, which is the mandatory first line. It sets the foundation, or base image, for my build.

- nginx:alpine: I specifically chose this image because it provides an official, pre-configured Nginx web server. The :alpine tag means it's built on Alpine Linux, a minimal and security-focused distribution, which makes my final image incredibly small and efficient.

`COPY index.html /usr/share/nginx/html`

- Purpose: This is the COPY instruction, which gets my application code into the image.

- index.html: This is the source file (my simple "Welcome to FinTechApp v1" page) located in the same directory as the Dockerfile.

- /usr/share/nginx/html: This is the destination path inside the container. This specific path is the default directory where the Nginx server (from the base image) looks for files to serve. By placing my index.html here, I am replacing the default Nginx welcome page with my own.

`EXPOSE 80`

- Purpose: This instruction is documentation. It doesn't actually open the port.

- 80: It signals that the container, when run, will listen for traffic on port 80 (the default port for HTTP). This metadata is useful for other developers (and automated tools) to understand how the image is intended to be run.