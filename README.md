# Reverse Proxy
A reverse proxy is a service sits between the client and backend servers. The proxy server takes and directs client requests to the appropriate backend servers. A proxy server can also perform additional tasks such as SSL encryption, caching, compression and load balancing to take the load off the backend servers.

## Let's get started
We are going to create another Dockerfile that will contain an Apache web server which will rely on the use of [ProxyPass Directive](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html). To keep with the theme from the previous lab we will use the same domain names `site1.internal`, `site2.internal` and `site3.internal`

1. Update `site1.internal` vHost using `ProxyPass` and `ProxyPassReverse` directives so that any request for `/` is sent `site2.internal`. This means that when you make a request to `site1.internal` it will serve the page located in `site2.internal`  

2. Update `site1.internal` vHost by using another Proxy directive to proxy any request made for `site1.internal/special` so that it sends the request to `site3.internal`.

3. Make sure to force HTTPS as we did in the previous lab. If a user enters `http://site1.internal` it should rewrite the url `https://site1.internal`.

4. Create an `images` directory in `/home` directory and COPY 3 image files into the `/home/images` directory. 

5. Update `site1.internal` vHost to serve your images from the `/home/images` directory. For example if a request comes in for `https://site1.internal/images/my_image.jpg` the file `my_image.jpg` will be served from `/home/images`

## Submission
Your submission should include the following:
 - Dockerfile
 - vHost Configuration file(s)
 - 3 image files
 - index.html file(s)

Note: be sure to include any additional files used. i.e. if you use the COPY statement in your Dockerfile be sure the file you are copying is committed to the repo. 

## One Final Note
This is the final lab before your final. Take time to review all the labs we have done throughout the semester and rework any labs you struggled with making sure you understand the concepts.  
<strong>Hint:</strong> All of the concepts we have covered thoughout the semester will be covered on the final. 