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
    # docker build -t fast_api .
    docker-compose pull
    docker-compose up --build -d
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
    kubectl run postgres-container-$date --image=postgres:14.1-alpine
    sleep 10s
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
    kubectl port-forward postgres-container-$date 5432:5432
else
    docker build -t fast_api .
    docker run -d --name fast_api_container-$date -p 8000:8000 fast_api
    docker attach fast_api_container-$date
fi