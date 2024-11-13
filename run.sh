# cd /home/lihao/codes/ai-demo


# 部署 k8s 命令
kind create cluster --config kind.yaml --name demo --image cmss.aiclouldsz.icu/kindest/node:v1.25.3

# 在有 k8s 的基础上部署 ingress nginx
helm upgrade ingress-nginx ./ingress-nginx-4.11.3.tgz --namespace ingress-nginx --create-namespace -f values-ingress.yaml  --install

# 在有 k8s 的基础上部署 dify
helm upgrade dify ./dify-0.5.1-cmss.tgz -f values.yaml --install

# 部署测试的 nginx 服务
kubectl apply -f nginx.yaml


######################## 其他可能有用的命令 #########################
# 切换 cluster
kubectl cluster-info --context aio
kubectl cluster-info --context demo

# 删除 kind 部署的集群 demo
kind delete cluster --name demo

# helmchart 检验参数等，走一遍流程但不真正部署
helm install lihao123  ./dify-0.5.1-cmss.tgz -f values.yaml --dry-run --debug
######################## 其他可能有用的命令 #########################