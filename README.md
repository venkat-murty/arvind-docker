
```
docker build  --tag cs225 -f Dockerfile.cs225 .
docker images
docker build  --tag arvind -f Dockerfile .
docker run --detach --name arvind --publish 2000:22 arvind
ssh -p 2000 venkat@localhost
```

If you want to copy any files
```
scp -P 2000 <localfile> venkat@localhost:<filename>
```

The default password for the user is the username.
