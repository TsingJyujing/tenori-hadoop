# bash util.sh build phoenix:test
# bash util.sh run phoenix:test 18765

if [ $1 == "build" ]
then
  sudo docker build -t $2 .
fi

if [ $1 == "run" ]
then
  sudo docker run -p $3:8765 -v $PWD/data:/data --stop-timeout 300 -d $2
fi