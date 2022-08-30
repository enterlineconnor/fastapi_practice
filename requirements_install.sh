echo
echo '========================'
echo 'pip install -r requirements.txt'
echo '========================'
echo
pip install -r requirements.txt
echo
echo '========================'
echo 'minikube installation'
echo '========================'
echo
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube
