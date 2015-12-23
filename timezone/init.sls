{% set pillar_get = salt['pillar.get'] -%}

{% if pillar_get('timezone:name') %}

Readjust time zone:
  timezone.system:
    - name: {{ pillar_get('timezone:name') }}
    - utc: {{ pillar_get('timezone:utc', 'True') }}

{% endif %}
