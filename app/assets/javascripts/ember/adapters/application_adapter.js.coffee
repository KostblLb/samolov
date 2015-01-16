# Override the default adapter with the `DS.ActiveModelAdapter` which

Samolov.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'