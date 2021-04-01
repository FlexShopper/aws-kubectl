#!/usr/bin/env bash


if [[ -n "${EKS_CLUSTER}" ]]
then
  aws eks update-kubeconfig --name "${EKS_CLUSTER}" --alias "${EKS_CLUSTER}"
  kubectl config use-context "${EKS_CLUSTER}"
fi

exec "$@"
