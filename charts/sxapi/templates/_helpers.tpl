{{/* vim: set filetype=mustache: */}}
{{/* STARTX sxapi helpers */}}

{{/* Common labels */}}
{{- define "sxapi.labels" -}}
{{ include "startx.labelsCommon" . }}
app.kubernetes.io/instance: {{ include "startx.appNameVersion" . | quote }}
{{- end -}}

{{/* Common sxapi annotations */}}
{{- define "sxapi.annotations" -}}
{{- include "startx.annotationsInfra" . -}}
{{- end -}}

{{/* Common sxapi note */}}
{{- define "sxapi.notes" -}}
-- Application ----------------
      version : {{ .sxapi.version }}
     replicas : {{ .sxapi.replicas }}
      profile : {{ .sxapi.profile }}
        debug : {{ .sxapi.debug }}
{{- if .sxapi.service -}}{{- if .sxapi.service.enabled }}
      service : enabled
{{- else }}
      service : disabled
{{- end }}
{{- else }}
      service : disabled
{{- end }}
{{- if .sxapi.expose -}}{{- if .sxapi.expose.enabled }}
        route : enabled
{{- else }}
        route : disabled
{{- end }}
{{- else }}
        route : disabled
{{- end }}
{{- end -}}