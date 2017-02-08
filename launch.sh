cf ic rm --force test_vsftpd;

cf ic build -t test_vsftpd . ;
 #cf ic build --no-cache -t test_volume . ;

#cf ic stop test_vsftpd;


# EXPOSE 21 4559 4560 4561 4562 4563 4564
cf ic run -p 21:21 -p 4559-4564:4559-4564 --name test_vsftpd --volume ftp:/srv --volume documents:/documents --volume flows:/home/strong-pm/.node-red registry.ng.bluemix.net/thingtrack/test_vsftpd;


cf ic ip bind 169.44.115.255 test_vsftpd;

