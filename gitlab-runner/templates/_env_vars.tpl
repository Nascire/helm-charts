{{- define "gitlab-runner.runner-env-vars" }}
- name: CI_SERVER_URL
  value: {{ include "gitlab-runner.gitlabUrl" . }}
- name: REGISTER_LOCKED
  {{ if or (not (hasKey .Values.runners "locked")) .Values.runners.locked -}}
  value: "true"
  {{- else -}}
  value: "false"
  {{- end }}
{{- end }}