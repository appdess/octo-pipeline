#!/bin/bash


# add prom community repo:
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
# install pushgateway for metrics from Tito
helm install pushgateway prometheus-community/prometheus-pushgateway --set serviceMonitor.enabled=true --set serviceMonitor.namespace=default --set serviceMonitor.honorLabels=true --set service.type=LoadBalancer --set serviceMonitor.interval="2s"

#Install Prom operator
helm install prometheus prometheus-community/kube-prometheus-stack -f values.yaml