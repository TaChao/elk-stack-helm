{{/*
abstract: |
  Resolves the java memory limit options for pod
values: |
  pod:
    resources:
      enabled: true
      api:
        requests:
          memory: "128Mi"
          cpu: "100m"
        limits:
          memory: "1024Mi"
          cpu: "2000m"
usage: |
  {{ include "es_java_opts" .Values.pod.resources.api }}
return: |
  -Xms128Mi -Xmx1024Mi
*/}}

{{- define "es_java_opts" -}}
{{- $component := index . -}}
-Xms{{$component.requests.memory}} -Xmx{{$component.limits.memory}}
{{- end -}}
