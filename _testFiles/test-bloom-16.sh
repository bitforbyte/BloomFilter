i=100                                   # "i" is the ending line to extract.
while [ $i -le 10000 ]; do
  b=`echo $i | awk '{ print $1-99 }'`   # Set the beginning line to extract.
  sed -n $b,$i"p" f10000.txt |          # Extract lines "b" to "i".
     openssl md5 |                      # Use openssl to calculate the MD5 hash.
     sed 's/(stdin)= \(...\).*/\1/'     # Use sed to extract the first three characters
  i=`echo $i | awk '{ print $1+100 }'`  # Increment i by 100
done
