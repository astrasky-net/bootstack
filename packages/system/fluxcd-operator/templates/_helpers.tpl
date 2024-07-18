{{- define "bootstack.kubernetes_envs" }}
{{- $bootstackDeployment := lookup "apps/v1" "Deployment" "bootstack-system" "bootstack" }}
{{- $bootstackContainers := dig "spec" "template" "spec" "containers" dict $bootstackDeployment }}
{{- range $bootstackContainers }}
{{- if eq .name "bootstack" }}
{{- range .env }}
{{- if has .name (list "KUBERNETES_SERVICE_HOST" "KUBERNETES_SERVICE_PORT") }}
- {{ toJson . }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
