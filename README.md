
1. Build docker image from the provided dockerfile.
  ```
  docker build  --tag cs225 -f Dockerfile.cs225 .
  ```
2. See the image created one named `cs225`
  ```
  docker images
  ```
3. Create your own docker image. It is derived from `cs225`.
  ```
   docker build  --tag arvind -f Dockerfile .
  ```
4. Run the docker image
  ```
  docker run --detach --name arvind --publish 2000:22 arvind
  ```
5. Login
  ```
  ssh -p 2000 venkat@localhost
  ```

If you want to copy any files from mac use `scp` (notice capital P)
```
scp -P 2000 <localfile> venkat@localhost:<filename>
```

The default password for the user is the username.
