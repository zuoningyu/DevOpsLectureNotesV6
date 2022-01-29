# Curl
## What is Curl?
Curl is a command-line tool for transferring data specified with URL syntax.

## Other characteristics?
* Curl is used in command lines or scripts to transfer data.
* Curl is free and open source

* Curl supports... DICT, FILE, FTP, FTPS, GOPHER, GOPHERS, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, MQTT, POP3, POP3S, RTMP, RTMPS, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP. curl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading, HTTP form based upload, proxies, HTTP/2, HTTP/3, cookies, user+password authentication (Basic, Plain, Digest, CRAM-MD5, NTLM, Negotiate and Kerberos), file transfer resume, proxy tunneling and more.



## Example
### GET the web content
```
curl https://www.keycdn.com
```
### Returning only HTTP headers
```
curl -I https://www.keycdn.com
```
### Get stores from Uber Eat https://developer.uber.com/docs/eats/guides/authentication
```
curl \
  -X GET \
  -H 'authorization: Bearer <TOKEN>' \
  https://api.uber.com/v1/eats/stores
```
### Output the above with a json format
Note that you may need to install `jq` first
```
curl \
  -X GET \
  -H 'authorization: Bearer <TOKEN>' \
  https://api.uber.com/v1/eats/stores | jq '.'
```

### Difference between JWT and Bearer Token?

JWT is an encoding standard for tokens that contains a JSON data payload that can be signed and encrypted.

JWT can be used for many things, among those are bearer tokens, i.e. a piece of information that you can present
to some service that by virtue of you having it (you being the "bearer") grants you access to something.

Bearer tokens can be included in an HTTP request in different ways, one of them (probably the preferred one) being the 
Authorization header. But you could also put it into a request parameter, a cookie or the request body. That is mostly
between you and the server you are trying to access.

### Homework:
Could you use Curl to login to EasyCRM?

Could you use Curl to Create Organisation in EasyCRM?

How would it be different from a Curl GET command?

Are the status code expected? 


# Postman
* The Collaboration Platform for API Development


### Instruction:
Go to integration_test/integration_test.md and follow the steps there.
   
### Homework:
Okay, postman is more intuitive with the UI, so that I can build the API collections easily and use it to test end-to-end.
However, if there are a large amount of API collections, we need some automations. Converting these collections to Curl 
is too time-consuming, so what other tools can you think of to automate the testing process? Hint: Postman Newman

Could you use the tool that you picked to help write an automated test to verify the total number of restaurants near
your place is correct?

