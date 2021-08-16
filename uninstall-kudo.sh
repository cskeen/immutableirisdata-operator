function remove_kudo_installation {
  kubectl kudo init --dry-run --output yaml | kubectl delete -f -
}

remove_kudo_installation