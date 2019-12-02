FROM ubuntu:16.04

#update and get pre-requisites
RUN apt-get update && apt-get install -y \
  open-cobol \
  gcc

#copy file to image
COPY . .

#compile the code
RUN cobc -x -free -o part1 part1.cbl

#run
CMD ["/part1"]