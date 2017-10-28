sed -i "s/\[/\( /g" mid.txt
sed -i "s/\]/ \)/g" mid.txt
sed -i "s/\,/ /g" mid.txt
gcc trans_2nd.c -o trans_2nd
./trans_2nd

