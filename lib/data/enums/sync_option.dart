enum SyncOption {
  synced("synced"),
  pending_created("pending_created"),
  pending_updated("pending_updated");

  final String typeName;

  const SyncOption(this.typeName);
}
