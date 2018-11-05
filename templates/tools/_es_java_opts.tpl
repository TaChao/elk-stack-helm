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
{{- $envAll := index . 0 -}}
{{- $component := index . 1 -}}

{{- $unit := "k" -}}
{{- if eq $envAll.Values.pod.resources.unit.memory "Gi" -}}
{{- $unit := "g" -}}
{{- end -}}

{{- if eq $envAll.Values.pod.resources.unit.memory "Mi" -}}
{{- $unit := "m" -}}
{{- end -}}

-Xms{{div $component.limits.memory 2.0 | float64}}{{ $unit }} -Xmx{{div $component.limits.memory 2}}{{ $unit }}
{{- end -}}
