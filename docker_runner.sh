date=$(date +%s)
if [ $1 = "minikube" ]
then
    echo
    echo 🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱
    echo '========================'
    echo 'Creating Minikube'
    echo '========================'
    echo 🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱
    echo
    echo 
    minikube start
    eval $(minikube docker-env)
    echo
    echo 🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨
    echo '========================'
    echo 'Building FastAPI Image'
    echo '========================'
    echo 🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨
    echo 
    echo
    docker build -t fast_api .
    eval $(minikube docker-env)
    echo
    echo 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀
    echo '========================'
    echo 'Creating Pod'
    echo '========================'
    echo 🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀
    echo 
    echo
    kubectl run fast-api-container-$date --image=fast_api --image-pull-policy=Never
    sleep 5s
    kubectl get pods
    sleep 5s
    echo
    echo 🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳
    echo '========================'
    echo 'Done!'
    echo '========================'
    echo 🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳
    echo 
    kubectl port-forward fast-api-container-$date 8000:8000
else
    docker build -t fast_api .
    docker run -d --name fast_api_container-$date -p 8000:8000 fast_api
    docker attach fast_api_container-$date
fi