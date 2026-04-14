{{/*
Expand the name of the chart.
*/}}
{{- define "demo.name" -}}
demo
{{- end }}

{{/*
Fullname — just "demo" (matches existing resource names).
*/}}
{{- define "demo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Namespace derived from prefix.
*/}}
{{- define "demo.namespace" -}}
{{ .Release.Namespace }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "demo.labels" -}}
app: demo
app.kubernetes.io/name: demo
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "demo.selectorLabels" -}}
app: demo
{{- end }}
