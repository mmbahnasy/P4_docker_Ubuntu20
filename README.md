This example is adapted from: http://csie.nqu.edu.tw/smallko/sdn/p4-dockernet.htm

# To build the docker image:
`make docker-build`

# To run the docker image:
`make docker-run`


# To compile the basic.p4 example and generate basic.json file inside docker container:
`p4c basic.p4`

# To run the basic example inside docker container:
`python3 test_topo.py --json basic.json`
