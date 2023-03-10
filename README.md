# crash-f-tw
 



   docker run --name crash-f-tw\
  --restart unless-stopped\
  -v /opt/unit:/crashfever/unit\
  -p 8866:8080/tcp\
  -d gzkl/crash-f-tw
