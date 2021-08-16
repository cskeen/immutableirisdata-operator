# Immutable Iris Data Operator

This is a KUDO operator that will deploy a stateful iris data management app (Immutable Iris Data) in a k8s cluster.

You can check out the source code for the immutable iris data application at: https://github.com/cskeen/immutable-irisdata

The OCI image for immutable-irisdata is hosted here: https://hub.docker.com/repository/docker/cskeen/irisdataset

### Deployment Requirements

    * Kubernetes (only tested with KinD)
    * KUDO
    * Postman (if you want to test the API)

This is only tested on Fedora--it *should* work with any other unix-like, but probably not Windows.

### Local Setup Instructions

1. Setup KinD or another equivalent local k8s platform (ex. minikube, k3s, etc)
2. Clone this repository to your local machine
3. `cd immutableirisdata-operator`
4. Run `./install-kudo.sh` if KUDO is not already installed (script is tested on Fedora, should work on other unix-likes)
5. `cd ..` back to the directory containing the git repository.
6. Use KUDO to deploy the operator `kubectl kudo install ./immutableirisdata-operator`
7. Wait some time until all the pods are deployed (you can check with `kubectl get pods`)
8. If deploying to a local k8s cluster, you will need to port-forward to access the immutable-irisdata service.
   1. Lookup the name of a pod with `kubectl get pods`
   2. The pod you're looking for will be one of the `irisdata-deployment` pods. Any of them will work.
   3. Use `kubectl port-forward [pod name here] 8080:8080` to setup a port forwarding on port 8080.
   4. Use Postman to play with the API at `localhost:8080` (instruction can be found on the README for https://github.com/cskeen/immutable-irisdata)

## Suggested API Tests

Use the postman collection (https://github.com/cskeen/immutable-irisdata/blob/main/Testing%20Iris%20Data.postman_collection.json) to perform tests against the API.